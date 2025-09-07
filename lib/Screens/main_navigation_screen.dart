import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_event_album/Screens/event_screen.dart';
import 'package:mini_event_album/Screens/profile_screen.dart';
import 'package:mini_event_album/shared/providers/navigation_provider.dart';
import 'package:mini_event_album/shared/widgets/primary_bottom_nav.dart';
import 'package:mini_event_album/core/theme/app_colors.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  ConsumerState<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(currentIndexProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          ref.read(currentIndexProvider.notifier).state = index;
        },
        children: const [EventsScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: PrimaryBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
