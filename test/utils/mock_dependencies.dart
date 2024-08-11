import 'package:flutter/material.dart';
import 'package:hi_bank_test_app/app/data/posts/posts_repository.dart';
import 'package:hi_bank_test_app/app/network/http_client.dart';
import 'package:mocktail/mocktail.dart';

class MockRoute extends Mock implements Route {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

final navigatorObserver = MockNavigatorObserver();

class MockHttpClient extends Mock implements HttpClient {}

final httpClient = MockHttpClient();

class MockPostsRepository extends Mock implements PostsRepository {}

final postsRepository = MockPostsRepository();

void initializeMocks() {
  reset(navigatorObserver);
  reset(httpClient);
  reset(postsRepository);

  registerFallbackValue(MockRoute());
}
