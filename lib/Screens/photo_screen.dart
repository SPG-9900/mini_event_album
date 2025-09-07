import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_event_album/core/theme/app_colors.dart';
import 'package:mini_event_album/features/likes/providers/likes_provider.dart';

class PhotoScreen extends ConsumerStatefulWidget {
  final List<String> photoPaths;
  final int initialIndex;
  const PhotoScreen({
    super.key,
    required this.photoPaths,
    required this.initialIndex,
  });

  @override
  ConsumerState<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends ConsumerState<PhotoScreen> {
  late PageController _pageController;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialIndex;
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final likedSet = ref.watch(likesProvider);
    final currentPhotoPath = widget.photoPaths[_currentPage];
    final isLiked = likedSet.contains(currentPhotoPath);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.text),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          children: [
            const Text('Photos', style: TextStyle(color: AppColors.text)),
            Text(
              '#${_currentPage + 1}',
              style: TextStyle(
                color: AppColors.text.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.photoPaths.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final photoPath = widget.photoPaths[index];
              return Center(
                child: Container(
                  width: 412,
                  height: 274.6666564941406,
                  decoration: const BoxDecoration(
                    color: AppColors.cardBackground,
                  ),
                  child: Image.network(photoPath, fit: BoxFit.contain),
                ),
              );
            },
          ),
          Positioned(
            bottom: 80.0,
            left: (MediaQuery.of(context).size.width / 2) - (56 / 2),
            child: FloatingActionButton(
              onPressed: () =>
                  ref.read(likesProvider.notifier).toggle(currentPhotoPath),
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Image.asset(
                'assets/images/like.png',
                color: isLiked ? AppColors.primary : null,
                colorBlendMode: isLiked ? BlendMode.srcIn : null,
                width: 56,
                height: 56,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
