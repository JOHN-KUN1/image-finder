import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<void> loadImages;
  late List<Album> imageAlbums;
  late bool permissionGranted;

  @override
  void initState() {
    super.initState();
    loadImages = loadAllImages();
  }

  Future<void> loadAllImages() async {
    if (await Permission.storage.request().isGranted) {
      imageAlbums = await PhotoGallery.listAlbums(
        mediumType: MediumType.image,
        newest: true,
        hideIfEmpty: false,
      );
      setState(() {
        permissionGranted = true;
      });
    } else {
      setState(() {
        permissionGranted = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Finder')),
      body: FutureBuilder(
        future: loadImages,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (asyncSnapshot.hasError) {
            return Center(child: Text(asyncSnapshot.error.toString()));
          } else {
            if (!permissionGranted) {
              return Center(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Icon(Icons.image, size: 50),
                    const SizedBox(height: 10),
                    Text('No Images', style: TextStyle(fontSize: 25)),
                    const SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: () {
                        openAppSettings();
                      },
                      child: Text('Grant Access'),
                    ),
                  ],
                ),
              );
            }
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 5),
              itemCount: imageAlbums.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final album = imageAlbums[index];
                return Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(width: 2, color: Colors.greenAccent),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AlbumThumbnailProvider(
                        album: album,
                        highQuality: true,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.75),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                          ),
                          padding: EdgeInsets.all(5),
                          child: Center(
                            child: Column(
                              children: [
                                Text(album.name ?? 'Unknown', style: TextStyle(color: Colors.white, fontSize: 14,),textAlign: TextAlign.center,),
                                Text('${album.count}',style: TextStyle(color: Colors.white, fontSize: 14))
                              ],
                            ),
                          ),
                        )
                      ],
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
