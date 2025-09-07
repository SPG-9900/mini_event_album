import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikesNotifier extends StateNotifier<Set<String>> {
  LikesNotifier() : super(<String>{});

  bool isLiked(String id) => state.contains(id);

  void toggle(String id) {
    if (state.contains(id)) {
      state = {...state}..remove(id);
    } else {
      state = {...state, id};
    }
  }
}

final likesProvider = StateNotifierProvider<LikesNotifier, Set<String>>(
  (ref) => LikesNotifier(),
);
