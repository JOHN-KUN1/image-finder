import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_finder/blocs/image_search/image_search_cubit.dart';
import 'package:image_finder/services/get_it_service.dart';
import 'package:image_finder/services/navigator_service.dart';
import 'package:image_picker/image_picker.dart';
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
  final imagePicker = ImagePicker();
  XFile? referenceImage;
  late Future<void> loadAlbumImages;
  List<Medium> albumImages = [];

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

  Widget _buildGrid() {
    return BlocConsumer<ImageSearchCubit, ImageSearchState>(
      listener: (context, state) {
        if (state.status == ImageSearchStatus.failure) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Error',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFF5A00),
                  ),
                ),
                content: Text(
                  'Something went wrong. Please check your internet connection and try again.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                actions: [
                  SizedBox.shrink(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      //errorMessage = '';
                    },
                    child: Text(
                      'OK',
                      style: const TextStyle(color: Color(0xFFFF5A00)),
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        if (state.status == ImageSearchStatus.initial) {
          return GridView.builder(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
              top: 8,
            ),
            itemCount: albumImages.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              crossAxisCount: 2,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (context, index) {
              final medium = albumImages[index];
              return GestureDetector(
                onTap: () async {
                  getIt<NavigationService>().navigate(
                    ImageViewer(allImages: albumImages, index: index),
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
        if (state.status == ImageSearchStatus.failure &&
            state.foundImages.isEmpty) {
          return const Center(
            child: Text(
              'No matching images found.',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
            top: 8,
          ),
          itemCount: state.foundImages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            crossAxisCount: 2,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final medium = state.foundImages[index];
            return GestureDetector(
              onTap: () async {
                getIt<NavigationService>().navigate(
                  ImageViewer(allImages: state.foundImages, index: index),
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageState = context.watch<ImageSearchCubit>().state;
    return PopScope(
      canPop: imageState.status != ImageSearchStatus.loading,
      onPopInvokedWithResult: (didPop, result) async {
        if (context.read<ImageSearchCubit>().state.status ==
            ImageSearchStatus.loading) {
          final shouldExit = await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Exit Album'),
                content: Text(
                  'Are you sure you want to leave? Exiting will stop the search',
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  TextButton(
                    child: Text('Confirm'),
                    onPressed: () => Navigator.pop(context, true),
                  ),
                ],
              );
            },
          );
          if (!mounted) return;
          if (shouldExit) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                '${albumImages.length} images & videos',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.white.withValues(alpha: 0.05),
              height: 1.0,
            ),
          ),
        ),
        body: FutureBuilder(
          future: loadAlbumImages,
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.waiting &&
                albumImages.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFFF5A00)),
              );
            } else if (asyncSnapshot.hasError) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'Error',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFFFF5A00),
                      ),
                    ),
                    content: Text(
                      asyncSnapshot.error.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  );
                },
              );
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1C23),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                    child: TextField(
                      readOnly: referenceImage != null,
                      enabled:
                          imageState.status != ImageSearchStatus.loading,
                      controller: _searchController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: referenceImage == null ? 'Describe to find image...' : 'Using reference image only',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: IconButton(
                          onPressed: () async {
                            if (_searchController.text.trim().isNotEmpty || referenceImage != null) {
                              FocusScope.of(context).unfocus();
                              await context.read<ImageSearchCubit>().search(
                                albumImages,
                                _searchController.text,
                                referenceImage?.path,
                              );
                            }
                          },
                          icon: Icon(Icons.search),
                          color: Colors.grey,
                        ),
                        suffixIcon:
                            imageState.status == ImageSearchStatus.success ||
                                imageState.status == ImageSearchStatus.loading
                            ? IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  FocusScope.of(context).unfocus();
                                  context
                                      .read<ImageSearchCubit>()
                                      .resetSearch();
                                },
                              )
                            : referenceImage != null
                            ? Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      height: 24.0,
                                      width: 24.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            File(referenceImage!.path),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.grey,
                                        size: 16,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          referenceImage = null;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )
                            : IconButton(
                                onPressed: () async {
                                  final pickedImage = await imagePicker
                                      .pickImage(source: ImageSource.gallery);
                                  setState(() {
                                    referenceImage = pickedImage;
                                  });
                                },
                                icon: Icon(
                                  Icons.image_search,
                                  color: Colors.grey,
                                ),
                              ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) async {
                        if (value.trim().isNotEmpty || referenceImage != null) {
                          FocusScope.of(context).unfocus();
                          await context.read<ImageSearchCubit>().search(
                            albumImages,
                            value,
                            referenceImage?.path,
                          );
                        }
                      },
                    ),
                  ),
                ),

                if (imageState.status == ImageSearchStatus.loading) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Analyzing images...',
                              style: TextStyle(
                                color: Color(0xFFFF5A00),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${imageState.processedCount} / ${albumImages.length}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: imageState.processedCount / albumImages.length,
                          backgroundColor: const Color(0xFF1A1C23),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFFFF5A00),
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],

                if (imageState.status == ImageSearchStatus.initial)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 4.0,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'All Images',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              height: 3,
                              width: 40,
                              color: const Color(0xFFFF5A00),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                if (imageState.status == ImageSearchStatus.success)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 4.0,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Found ${imageState.foundImages.length} results',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              height: 3,
                              width: 40,
                              color: const Color(0xFFFF5A00),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 8),

                Expanded(
                  child: _buildGrid(),
                ),
              ],
            );
          },
        ),
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
          icon: const Icon(
            Icons.close,
            color: Colors.white,
            shadows: [Shadow(color: Colors.black, blurRadius: 4)],
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          final newMedium = widget.allImages[index];
          return PhotoViewGalleryPageOptions(
            imageProvider: PhotoProvider(mediumId: newMedium.id),
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
                  : event.cumulativeBytesLoaded /
                        (event.expectedTotalBytes ?? 1),
            ),
          ),
        ),
        pageController: _pageController,
        backgroundDecoration: const BoxDecoration(color: Colors.black),
      ),
    );
  }
}
