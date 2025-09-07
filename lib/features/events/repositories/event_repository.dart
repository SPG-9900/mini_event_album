import 'package:flutter/services.dart' show rootBundle;
import 'package:mini_event_album/features/events/models/event.dart';

class EventRepository {
  const EventRepository();

  Future<List<EventModel>> fetchEvents() async {
    final jsonStr = await rootBundle.loadString('assets/data/mock_data.json');
    return EventModel.listFromJsonString(jsonStr);
  }
}
