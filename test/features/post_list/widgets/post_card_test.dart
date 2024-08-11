import 'package:flutter_test/flutter_test.dart';
import 'package:hi_bank_test_app/app/data/posts/model/post_response.dart';
import 'package:hi_bank_test_app/features/post_list/widgets/post_card.dart';

import '../../../utils/mock_dependencies.dart';
import '../../../utils/test_app.dart';

void main() {
  setUp(() {
    initializeMocks();
  });

  testWidgets('PostCard should show correct content', (tester) async {
    await tester.pumpScreen();

    expect(find.text('User ID: 1'), findsOneWidget);
    expect(find.text('Post ID: 2'), findsOneWidget);
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Body'), findsOneWidget);
  });
}

extension _WidgetTesterExtension on WidgetTester {
  Future<void> pumpScreen() async {
    binding.platformDispatcher.textScaleFactorTestValue = 0.1;

    await pumpWidget(
      TestApp(
        navigatorObservers: [navigatorObserver],
        child: const PostCard(data: _postResponse),
      ),
    );

    await pumpAndSettle();
  }
}

const _postResponse = PostResponse(
  userId: 1,
  id: 2,
  title: 'Title',
  body: 'Body',
);
