import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_event_album/features/likes/providers/likes_provider.dart';

void main() {
  group('LikesNotifier', () {
    test('should toggle a like correctly', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(likesProvider.notifier);

      expect(notifier.isLiked('photo1'), isFalse);

      notifier.toggle('photo1');
      expect(notifier.isLiked('photo1'), isTrue);
      expect(notifier.state.length, 1);

      notifier.toggle('photo1');
      expect(notifier.isLiked('photo1'), isFalse);
      expect(notifier.state.length, 0);

      notifier.toggle('photo2');
      notifier.toggle('photo3');
      expect(notifier.isLiked('photo2'), isTrue);
      expect(notifier.isLiked('photo3'), isTrue);
      expect(notifier.state.length, 2);
    });
  });
}
