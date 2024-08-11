import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_bank_test_app/app/data/posts/model/post_response.dart';
import 'package:hi_bank_test_app/app/network/http_client.dart';

class PostsRepository {
  PostsRepository(
    this._httpClient,
  );

  static final provider = Provider((ref) {
    return PostsRepository(
      ref.watch(HttpClient.provider),
    );
  });

  final HttpClient _httpClient;

  Future<List<PostResponse>> getPosts() async {
    final response = await _httpClient.get<List<dynamic>>(
      path: '/posts',
    );

    return response.map((e) => PostResponse.fromJson(e)).toList();
  }

  Future<PostResponse> getPostDetails({
    required int id,
  }) async {
    final response = await _httpClient.get<Map<String, dynamic>>(
      path: '/posts/$id',
    );

    return PostResponse.fromJson(response);
  }
}
