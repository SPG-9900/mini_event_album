import 'dart:convert';

class EventModel {
  final String id;
  final DateTime createdAt;
  final String name;
  final String thumbnail;
  final List<String> photos;

  EventModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.thumbnail,
    required this.photos,
  });

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      name: map['name'] as String,
      thumbnail: map['thumbnail'] as String,
      photos: (map['photos'] as List).map((e) => e.toString()).toList(),
    );
  }

  static List<EventModel> listFromJsonString(String jsonStr) {
    final data = json.decode(jsonStr) as List<dynamic>;
    return data.map((e) => EventModel.fromMap(e as Map<String, dynamic>)).toList();
  }
}
