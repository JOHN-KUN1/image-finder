import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_finder/services/api_service.dart';
import 'package:image_finder/services/get_it_service.dart';
import 'package:image_finder/services/navigator_service.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class AlbumImagesScreen extends StatefulWidget {
  final Album album;
  const AlbumImagesScreen({super.key, required this.album});

  @override
  State<AlbumImagesScreen> createState() => _AlbumImagesScreenState();
}

class _AlbumImagesScreenState extends State<AlbumImagesScreen> {
  late Future<void> loadAlbumImages;
  List<Medium> albumImages = [];
  List<Medium> foundImages = [];
  
  bool isSearching = false;
  double searchProgress = 0.0;
  int processedCount = 0;
  bool hasSearched = false;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadAlbumImages = loadAllAlbumImages();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> loadAllAlbumImages() async {
    final imagePage = await widget.album.listMedia();
    if (mounted) {
      setState(() {
        albumImages = [...imagePage.items];
      });
    }
  }

  Future<void> findCorrespondingImages(String description) async {
    if (description.trim().isEmpty) return;
    
    setState(() {
      hasSearched = true;
      isSearching = true;
      foundImages.clear();
      processedCount = 0;
      searchProgress = 0.0;
    });

    FocusScope.of(context).unfocus();

    final options = BaseOptions(
      method: 'POST',
      headers: {"x-goog-api-key": dotenv.env['API_KEY'] as String},
      contentType: 'application/json',
    );
    final dio = Dio(options);
    final api = ApiService(dio: dio);

    const int batchSize = 5;
    for (int i = 0; i < albumImages.length; i += batchSize) {
      final batch = albumImages.skip(i).take(batchSize).toList();
      
      await Future.wait(batch.map((image) async {
        try {
          final imageFile = await image.getFile();
          final imgPath = base64Encode(imageFile.readAsBytesSync());
          final response = await api.getInsights(description, imgPath);
          
          if (response.trim().toLowerCase() == 'yes') {
            if (mounted) {
              setState(() {
                foundImages.add(image);
              });
            }
          }
        } catch (e) {
          log('Error processing image: $e');
        } finally {
          if (mounted) {
            setState(() {
              processedCount++;
              searchProgress = processedCount / albumImages.length;
            });
          }
        }
      }));
    }

    if (mounted) {
      setState(() {
        isSearching = false;
      });
    }
  }

  Widget _buildGrid(List<Medium> images) {
    if (images.isEmpty && hasSearched && !isSearching) {
      return const Center(
        child: Text(
          'No matching images found.',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        crossAxisCount: 2,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final medium = images[index];
        return GestureDetector(
          onTap: () async {
            getIt<NavigationService>().navigate(
              ImageViewer(
                allImages: images,
                index: index,
              ),
            );
          },
          child: Hero(
            tag: medium.id,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFF1E1E24),
              ),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: MemoryImage(kTransparentImage),
                image: ThumbnailProvider(
                  mediumId: medium.id,
                  mediumType: MediumType.image,
                  width: 256,
                  height: 256,
                  highQuality: true,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.album.name ?? 'Gallery',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              '${albumImages.length} images & videos',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.white.withOpacity(0.05), height: 1.0),
        ),
      ),
      body: FutureBuilder(
        future: loadAlbumImages,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting && albumImages.isEmpty) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFFFF5A00)));
          } else if (asyncSnapshot.hasError) {
            return Center(child: Text(asyncSnapshot.error.toString(), style: const TextStyle(color: Colors.red)));
          }
          
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1C23),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Describe to find image...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      suffixIcon: hasSearched
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.grey),
                            onPressed: () {
                              _searchController.clear();
                              FocusScope.of(context).unfocus();
                              setState(() {
                                hasSearched = false;
                                isSearching = false;
                                foundImages.clear();
                              });
                            },
                          )
                        : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) => findCorrespondingImages(value),
                  ),
                ),
              ),

              if (isSearching) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Analyzing images...', style: TextStyle(color: Color(0xFFFF5A00), fontWeight: FontWeight.bold)),
                          Text('$processedCount / ${albumImages.length}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: searchProgress,
                        backgroundColor: const Color(0xFF1A1C23),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF5A00)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
              
              if (!isSearching && !hasSearched)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('All Images', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 4),
                          Container(height: 3, width: 40, color: const Color(0xFFFF5A00)),
                        ],
                      ),
                    ],
                  ),
                ),
                
              if (hasSearched && !isSearching)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Found ${foundImages.length} results', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 4),
                          Container(height: 3, width: 40, color: const Color(0xFFFF5A00)),
                        ],
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 8),

              Expanded(
                child: _buildGrid(hasSearched ? foundImages : albumImages),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ImageViewer extends StatefulWidget {
  final int index;
  final List<Medium> allImages;
  const ImageViewer({super.key, required this.allImages, required this.index});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white, shadows: [Shadow(color: Colors.black, blurRadius: 4)]),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          final newMedium = widget.allImages[index];
          return PhotoViewGalleryPageOptions(
            imageProvider: PhotoProvider(
              mediumId: newMedium.id,
            ),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
            heroAttributes: PhotoViewHeroAttributes(tag: newMedium.id),
          );
        },
        itemCount: widget.allImages.length,
        loadingBuilder: (context, event) => Center(
          child: SizedBox(
            width: 30.0,
            height: 30.0,
            child: CircularProgressIndicator(
              color: const Color(0xFFFF5A00),
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
            ),
          ),
        ),
        pageController: _pageController,
        backgroundDecoration: const BoxDecoration(color: Colors.black),
      ),
    );
  }
}
