import 'package:flutter/material.dart';
import 'package:mini_event_album/core/theme/app_colors.dart';
import 'main_navigation_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        _controller.forward();
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MainNavigationScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            final tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: Curves.easeIn));
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 200),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SlideTransition(
          position: _slideAnimation,
          child: const CircularProgressIndicator(
            color: AppColors.primary,
            strokeWidth: 3,
          ),
        ),
      ),
    );
  }
}
