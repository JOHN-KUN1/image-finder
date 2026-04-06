import 'package:flutter/material.dart';
import 'package:image_finder/screens/album_images_screen.dart';
import 'package:image_finder/services/get_it_service.dart';
import 'package:image_finder/services/navigator_service.dart';
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
  List<Album> imageAlbums = [];
  bool permissionGranted = false;

  @override
  void initState() {
    super.initState();
    loadImages = loadAllImages();
  }

  Future<void> loadAllImages() async {
    if (await Permission.storage.request().isGranted) {
      final albums = await PhotoGallery.listAlbums(
        mediumType: MediumType.image,
        newest: true,
        hideIfEmpty: true,
      );
      if (mounted) {
        setState(() {
          imageAlbums = albums;
          permissionGranted = true;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          permissionGranted = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.white.withOpacity(0.05), height: 1.0),
        ),
      ),
      body: FutureBuilder(
        future: loadImages,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFFFF5A00)));
          } else if (asyncSnapshot.hasError) {
            return Center(child: Text(asyncSnapshot.error.toString(), style: const TextStyle(color: Colors.red)));
          } else {
            if (!permissionGranted) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.image_not_supported, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    const Text('Cannot access images', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 8),
                    const Text('Please grant storage permissions to continue.', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 24),
                    OutlinedButton(
                      onPressed: openAppSettings,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFFF5A00),
                        side: const BorderSide(color: Color(0xFFFF5A00)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Grant Access', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              );
            }
            
            if (imageAlbums.isEmpty) {
              return const Center(
                child: Text('No albums found.', style: TextStyle(color: Colors.grey, fontSize: 16)),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: imageAlbums.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                final album = imageAlbums[index];
                return GestureDetector(
                  onTap: () => getIt<NavigationService>().navigate(AlbumImagesScreen(album: album)),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E24),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        FadeInImage(
                          fit: BoxFit.cover,
                          placeholder: MemoryImage(kTransparentImage),
                          image: AlbumThumbnailProvider(
                            album: album,
                            highQuality: true,
                          ),
                        ),
                        Positioned(
                          bottom: 0, left: 0, right: 0,
                          height: 70,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [Colors.black.withOpacity(0.9), Colors.transparent],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 12, left: 12, right: 12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                album.name ?? 'Unknown',
                                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${album.count} items',
                                style: const TextStyle(color: Colors.white70, fontSize: 12),
                              )
                            ],
                          ),
                        ),
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
