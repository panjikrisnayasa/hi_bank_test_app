import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hi_bank_test_app/app/data/posts/model/post_response.dart';
import 'package:hi_bank_test_app/app/data/posts/posts_repository.dart';
import 'package:hi_bank_test_app/app/widgets/empty_data_widget.dart';
import 'package:hi_bank_test_app/app/widgets/error_state_widget.dart';
import 'package:hi_bank_test_app/features/post_list/post_list_screen.dart';
import 'package:hi_bank_test_app/features/post_list/widgets/post_card.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mock_dependencies.dart';
import '../../utils/test_app.dart';

void main() {
  setUp(() {
    initializeMocks();

    when(
      () => postsRepository.getPosts(),
    ).thenAnswer(
      (_) async => _postResponseList,
    );

    when(
      () => postsRepository.getPostDetails(id: _postId),
    ).thenAnswer(
      (_) async => _postResponse,
    );
  });

  testWidgets(
      'PostListScreen should show correct content when all data loaded successfully',
      (tester) async {
    await tester.pumpScreen();

    expect(find.text('Daftar Post'), findsOneWidget);
    expectPostListFound();

    verify(
      () => postsRepository.getPosts(),
    );
  });

  testWidgets(
      'PostListScreen should show correct content when got error and reload the screen after pressing Try Again button',
      (tester) async {
    when(
      () => postsRepository.getPosts(),
    ).thenThrow(_exception);

    await tester.pumpScreen();

    expectPostListNotFound();
    expect(find.byType(ErrorStateWidget), findsOneWidget);

    when(
      () => postsRepository.getPosts(),
    ).thenAnswer(
      (_) async => _postResponseList,
    );

    await tester.tap(_tryAgainButton);
    await tester.pumpAndSettle();

    expectPostListFound();

    verify(
      () => postsRepository.getPosts(),
    ).called(2);
  });

  testWidgets(
      'PostListScreen should show correct content when the list data is empty',
      (tester) async {
    when(
      () => postsRepository.getPosts(),
    ).thenAnswer(
      (_) async => [],
    );

    await tester.pumpScreen();

    expectPostListNotFound();
    expect(find.byType(EmptyDataWidget), findsOneWidget);

    verify(
      () => postsRepository.getPosts(),
    );
  });

  testWidgets('Search and find out the post', (tester) async {
    await tester.pumpScreen();

    await tester.enterText(_searchField, _postId.toString());
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    expect(find.byType(PostCard), findsOneWidget);
    expect(find.text('Post ID: $_postId'), findsOneWidget);

    verifyInOrder([
      () => postsRepository.getPosts(),
      () => postsRepository.getPostDetails(id: _postId),
    ]);
  });

  testWidgets('Search post but got error', (tester) async {
    const postId = 123;

    await tester.pumpScreen();

    when(
      () => postsRepository.getPostDetails(id: postId),
    ).thenThrow(_exception);

    await tester.enterText(_searchField, postId.toString());
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    expectPostListNotFound();
    expect(find.byType(ErrorStateWidget), findsOneWidget);

    verifyInOrder([
      () => postsRepository.getPosts(),
      () => postsRepository.getPostDetails(id: postId),
    ]);
  });
}

void expectPostListFound() {
  expect(_postList, findsOneWidget);
  expect(find.byType(PostCard), findsWidgets);
}

void expectPostListNotFound() {
  expect(_postList, findsNothing);
  expect(find.byType(PostCard), findsNothing);
}

void expectPostItem({
  required int number,
  required Matcher matcher,
}) {
  expect(
    find.byKey(Key('post_item_$number')),
    matcher,
  );
}

extension _WidgetTesterExtension on WidgetTester {
  Future<void> pumpScreen() async {
    binding.platformDispatcher.textScaleFactorTestValue = 0.1;

    await pumpWidget(
      TestApp(
        overrides: [
          PostsRepository.provider.overrideWithValue(postsRepository),
        ],
        navigatorObservers: [navigatorObserver],
        child: const PostListScreen(),
      ),
    );

    await pumpAndSettle();
  }
}

final _postList = find.byKey(const Key('post_list'));
final _tryAgainButton = find.descendant(
  of: find.byType(ElevatedButton),
  matching: find.text('Coba Lagi'),
);
final _searchField = find.byKey(const Key('search_field'));

final _exception = Exception('error');

const _postId = 1;

const _postResponse = PostResponse(
  id: _postId,
  userId: 2,
  title: 'title1',
  body: 'body1',
);
const _postResponseList = <PostResponse>[
  _postResponse,
  PostResponse(
    id: 2,
    userId: 3,
    title: 'title2',
    body: 'body2',
  ),
];
