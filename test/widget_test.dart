import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mini_event_album/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_event_album/features/likes/providers/likes_provider.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  test('LikesNotifier toggles like status correctly', () {
    final container = ProviderContainer();
    final notifier = container.read(likesProvider.notifier);

    const photoId = 'test_photo_id_1';

    expect(notifier.isLiked(photoId), false);

    notifier.toggle(photoId);
    expect(notifier.isLiked(photoId), true);

    notifier.toggle(photoId);
    expect(notifier.isLiked(photoId), false);

    container.dispose();
  });
}
