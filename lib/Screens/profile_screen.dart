import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_event_album/core/theme/app_colors.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        AppBar(
          title: const Text('Profile', style: TextStyle(color: AppColors.text)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.background,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/74636952?v=4',
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Prathamesh Sahare',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'Mobile App Developer | Flutter Enthusiast',
                  style: TextStyle(color: AppColors.text, fontSize: 16),
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ProfileStat(label: 'Events Attended', value: '12'),
                  _ProfileStat(label: 'Photos Liked', value: '250'),
                ],
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: AppColors.text, fontSize: 14),
        ),
      ],
    );
  }
}
