import 'package:flutter/material.dart';
import 'package:mini_event_album/Screens/photo_screen.dart';
import 'package:mini_event_album/features/events/models/event.dart';
import 'package:mini_event_album/core/theme/app_colors.dart';

class AlbumScreen extends StatelessWidget {
  final EventModel event;
  const AlbumScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final photos = event.photos;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.text),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(event.name, style: const TextStyle(color: AppColors.text)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            childAspectRatio: 1.0,
          ),
          itemCount: photos.length,
          itemBuilder: (context, index) {
            final url = photos[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        PhotoScreen(photoPaths: photos, initialIndex: index),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          final tween = Tween(
                            begin: begin,
                            end: end,
                          ).chain(CurveTween(curve: Curves.easeIn));
                          final offsetAnimation = animation.drive(tween);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                    transitionDuration: const Duration(milliseconds: 200),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(child: Image.network(url, fit: BoxFit.cover)),
              ),
            );
          },
        ),
      ),
    );
  }
}
