import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class AlbumImageScreen extends StatefulWidget {
  final Album album;
  const AlbumImageScreen({super.key, required this.album});

  @override
  State<AlbumImageScreen> createState() => _AlbumImagesScreenState();
}

class _AlbumImagesScreenState extends State<AlbumImageScreen> {
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
            return Container(
              child: PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  final medium = albumImages[index];
                  return PhotoViewGalleryPageOptions(
                    imageProvider: ThumbnailProvider(
                      mediumId: medium.id,
                      mediumType: MediumType.image,
                      width: 128,
                      height: 128,
                      highQuality: true,
                    ),
                    initialScale: PhotoViewComputedScale.contained * 0.8,
                    heroAttributes: PhotoViewHeroAttributes(
                      tag: medium.id,
                    ),
                  );
                },
                itemCount: albumImages.length,
                loadingBuilder: (context, event) => Center(
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(
                      value: event == null
                          ? 0
                          : event.cumulativeBytesLoaded /
                                event.expectedTotalBytes!,
                    ),
                  ),
                ),
                // backgroundDecoration: widget,
                // pageController: widget.pageController,
                // onPageChanged: onPageChanged,
              ),
            );
          }
        },
      ),
    );
  }
}
