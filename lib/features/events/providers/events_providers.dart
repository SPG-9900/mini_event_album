import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_event_album/features/events/models/event.dart';
import 'package:mini_event_album/features/events/repositories/event_repository.dart';

final eventRepositoryProvider = Provider<EventRepository>((ref) {
  return const EventRepository();
});

final eventsProvider = FutureProvider<List<EventModel>>((ref) async {
  final repo = ref.watch(eventRepositoryProvider);
  return repo.fetchEvents();
});
