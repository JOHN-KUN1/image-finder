import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
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
  bool searchedForImage = false;
  String imageDescription = '';

  @override
  void initState() {
    super.initState();
    loadAlbumImages = loadAllAlbumImages();
  }

  Future<void> loadAllAlbumImages() async {
    final imagePage = await widget.album.listMedia();
    albumImages = [...imagePage.items];
  }

  Future<void> findCorrespondingImages(String description) async {
    final options = BaseOptions(
      method: 'POST',
      headers: {"x-goog-api-key": dotenv.env['API_KEY'] as String},
      contentType: 'application/json',
    );
    final dio = Dio(options);
    for (final image in albumImages) {
      final imageFile = await image.getFile();
      final imgPath = base64Encode(imageFile.readAsBytesSync());
      final response = await ApiService(
        dio: dio,
      ).getInsights(description, imgPath);
      if (response == 'yes') {
        foundImages.add(image);
      }
    }
    log('$foundImages');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.album.name!)),
      body: Center(
        child: Column(
          mainAxisSize: .max,
          children: [
            SearchBar(
              hintText: 'Describe image here...',
              onSubmitted: (value) {
                setState(() {
                  imageDescription = value;
                  searchedForImage = true;
                });
              },
            ),
            SizedBox(height: 7),
            searchedForImage
                ? FutureBuilder(
                    future: findCorrespondingImages(imageDescription),
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Expanded(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (asyncSnapshot.hasError) {
                        return Center(
                          child: Text(asyncSnapshot.error.toString()),
                        );
                      } else {
                        return Expanded(
                          child: GridView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            itemCount: foundImages.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 2,
                                  crossAxisSpacing: 2,
                                  crossAxisCount: 4,
                                ),
                            itemBuilder: (context, index) {
                              final medium = foundImages[index];
                              return GestureDetector(
                                onTap: () async {
                                  getIt<NavigationService>().navigate(
                                    ImageViewer(
                                      allImages: albumImages,
                                      index: index,
                                    ),
                                  );
                                },
                                child: FadeInImage(
                                  fit: BoxFit.cover,
                                  placeholder: MemoryImage(kTransparentImage),
                                  image: ThumbnailProvider(
                                    mediumId: medium.id,
                                    mediumType: MediumType.image,
                                    width: 128,
                                    height: 128,
                                    highQuality: true,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  )
                : FutureBuilder(
                    future: loadAlbumImages,
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Expanded(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (asyncSnapshot.hasError) {
                        return Center(
                          child: Text(asyncSnapshot.error.toString()),
                        );
                      } else {
                        return Expanded(
                          child: GridView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            itemCount: albumImages.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 2,
                                  crossAxisSpacing: 2,
                                  crossAxisCount: 4,
                                ),
                            itemBuilder: (context, index) {
                              final medium = albumImages[index];
                              return GestureDetector(
                                onTap: () async {
                                  getIt<NavigationService>().navigate(
                                    ImageViewer(
                                      allImages: albumImages,
                                      index: index,
                                    ),
                                  );
                                },
                                child: FadeInImage(
                                  fit: BoxFit.cover,
                                  placeholder: MemoryImage(kTransparentImage),
                                  image: ThumbnailProvider(
                                    mediumId: medium.id,
                                    mediumType: MediumType.image,
                                    width: 128,
                                    height: 128,
                                    highQuality: true,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
          ],
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            final newMedium = widget.allImages[index];
            return PhotoViewGalleryPageOptions(
              imageProvider: PhotoProvider(
                mediumId: newMedium.id,
              ), //FileImage(file),
              initialScale: PhotoViewComputedScale.contained,
              heroAttributes: PhotoViewHeroAttributes(tag: newMedium.id),
            );
          },
          itemCount: widget.allImages.length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
              ),
            ),
          ),
          pageController: PageController(initialPage: widget.index),
          // onPageChanged: (index) async {
          //   final orgFile = await widget.allImages[index].getFile();
          //   setState(() {
          //     imageFile = orgFile;
          //   });
          // },
          backgroundDecoration: const BoxDecoration(color: Colors.black),
          // onPageChanged: onPageChanged,
        ),
      ),
    );
  }
}
