import 'package:flutter/material.dart';
import 'package:mini_event_album/core/theme/app_colors.dart';

class PrimaryBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const PrimaryBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.celebration, size: 24, color: AppColors.text),
          activeIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.selectedtab,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.celebration,
              size: 24,
              color: AppColors.primary,
            ),
          ),
          label: 'EVENTS',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_pin, size: 24, color: AppColors.text),
          activeIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.selectedtab,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.person_pin,
              size: 24,
              color: AppColors.primary,
            ),
          ),
          label: 'ME',
        ),
      ],
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.text,
      backgroundColor: AppColors.background,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
    );
  }
}
