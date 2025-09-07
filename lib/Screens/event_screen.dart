import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_event_album/core/theme/app_colors.dart';
import 'package:mini_event_album/features/events/models/event.dart';
import 'package:mini_event_album/features/events/providers/events_providers.dart';
import 'album_screen.dart';

class EventsScreen extends ConsumerWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(eventsProvider);
    return Column(
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.background,
          centerTitle: true,
          title: const Text(
            'Assignment App',
            style: TextStyle(color: AppColors.text),
          ),
        ),
        Expanded(
          child: eventsAsync.when(
            loading: () => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 3,
              ),
            ),
            error: (e, st) => Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Failed to load events\n$e',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            data: (events) => ListView.separated(
              itemCount: events.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final event = events[index];
                return _buildEventItem(context, event);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEventItem(BuildContext context, EventModel event) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                AlbumScreen(event: event),
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
        height: 221.29,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(event.thumbnail, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 177,
              left: 0,
              child: Container(
                width: 220,
                height: 44,
                decoration: const BoxDecoration(
                  color: AppColors.eventButtonBackground,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(4)),
                ),
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  event.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.eventButtonText,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                    letterSpacing: 0.15,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
