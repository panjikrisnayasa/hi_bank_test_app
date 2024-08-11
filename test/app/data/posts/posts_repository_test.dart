import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hi_bank_test_app/app/data/posts/model/post_response.dart';
import 'package:hi_bank_test_app/app/data/posts/posts_repository.dart';
import 'package:hi_bank_test_app/app/network/http_client.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/mock_dependencies.dart';

void main() {
  PostsRepository? repository;

  setUp(() {
    initializeMocks();

    final container = ProviderContainer(
      overrides: [
        HttpClient.provider.overrideWithValue(httpClient),
      ],
    );
    repository = container.read(PostsRepository.provider);
  });

  group('Validate getPosts()', () {
    test('getPosts() success', () async {
      when(
        () => httpClient.get<List<dynamic>>(
          path: '/posts',
        ),
      ).thenAnswer((_) async => _mockPostResponseList);

      final result = await repository?.getPosts();

      expect(
        result,
        _expectedPostResponseList,
      );
    });

    test('getPosts() got exception', () async {
      when(
        () => httpClient.get<List<dynamic>>(
          path: '/posts',
        ),
      ).thenThrow(_exception);

      expect(
        () async => repository?.getPosts(),
        throwsA(_exception),
      );
    });
  });

  group('Validate getPostDetails()', () {
    test('getPostDetails() success', () async {
      when(
        () => httpClient.get<Map<String, dynamic>>(
          path: '/posts/$_id',
        ),
      ).thenAnswer((_) async => _mockPostResponse);

      final result = await repository?.getPostDetails(id: _id);

      expect(
        result,
        _expectedPostResponse,
      );
    });

    test('getPostDetails() got exception', () async {
      when(
        () => httpClient.get<Map<String, dynamic>>(
          path: '/posts/$_id',
        ),
      ).thenThrow(_exception);

      expect(
        () async => repository?.getPostDetails(id: _id),
        throwsA(_exception),
      );
    });
  });
}

final _exception = Exception('error');

const _id = 1;

final _mockPostResponseList = [
  {
    "userId": 1,
    "id": _id,
    "title":
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body":
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
  },
  {
    "userId": 1,
    "id": 2,
    "title": "qui est esse",
    "body":
        "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla",
  },
];

const _expectedPostResponseList = [
  PostResponse(
    userId: 1,
    id: _id,
    title:
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body:
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
  ),
  PostResponse(
    userId: 1,
    id: 2,
    title: "qui est esse",
    body:
        "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla",
  ),
];

final _mockPostResponse = {
  "userId": 1,
  "id": _id,
  "title":
      "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body":
      "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
};

const _expectedPostResponse = PostResponse(
  userId: 1,
  id: _id,
  title:
      "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  body:
      "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
);
