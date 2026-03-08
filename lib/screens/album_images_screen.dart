import 'dart:developer';
import 'dart:io';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAlbumImages = loadAllAlbumImages();
  }

  Future<void> loadAllAlbumImages() async {
    final imagePage = await widget.album.listMedia();
    albumImages = [...imagePage.items];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.album.name!)),
      body: FutureBuilder(
        future: loadAlbumImages,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (asyncSnapshot.hasError) {
            return Center(child: Text(asyncSnapshot.error.toString()));
          } else {
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 5),
              itemCount: albumImages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                final medium = albumImages[index];
                return GestureDetector(
                  onTap: () async {
                    log('tapped');
                    final file = await medium.getFile();
                    getIt<NavigationService>().navigate(ImageViewer(medium: medium, allImages: albumImages, file: file,));
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
            );
          }
        },
      ),
    );
  }
}

class ImageViewer extends StatelessWidget {
  final File file;
  final List<Medium> allImages;
  final Medium medium;
  const ImageViewer({super.key, required this.medium, required this.allImages, required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: FileImage(file),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes: PhotoViewHeroAttributes(
                tag: medium.id,
              ),
            );
          },
          itemCount: allImages.length,
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
          // backgroundDecoration: widget.backgroundDecoration,
          // pageController: widget.pageController,
          // onPageChanged: onPageChanged,
        ),
      ),
    );
  }
}
