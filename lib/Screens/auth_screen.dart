import 'package:flutter/material.dart';
import 'package:mini_event_album/core/theme/app_colors.dart';
import 'loading_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.text,
                foregroundColor: AppColors.cardBackground,
                elevation: 2,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(261, 54),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const LoadingScreen(),
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/images/google.png'),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Continue with Google',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      letterSpacing: 0.0,
                      color: AppColors.cardBackground,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
