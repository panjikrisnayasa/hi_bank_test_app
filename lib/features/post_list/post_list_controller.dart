import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hi_bank_test_app/app/data/posts/model/post_response.dart';
import 'package:hi_bank_test_app/app/data/posts/posts_repository.dart';

part 'post_list_controller.freezed.dart';

class PostListController extends StateNotifier<PostListUiState> {
  PostListController(this._postsRepository) : super(const PostListUiState());

  static final provider =
      StateNotifierProvider.autoDispose<PostListController, PostListUiState>(
    (ref) => PostListController(
      ref.watch(PostsRepository.provider),
    ),
  );

  final PostsRepository _postsRepository;

  Timer? _debouncer;
  String _searchValue = '';

  @override
  dispose() {
    _debouncer?.cancel();
    super.dispose();
  }

  Future<void> onScreenLoaded() async {
    await _getPosts();
  }

  Future<void> onReload() async {
    if (_searchValue.isEmpty) {
      await _getPosts();
    } else {
      await _getPostDetails(_searchValue);
    }
  }

  Future<void> _getPosts() async {
    state = state.copyWith(postsUiState: const AsyncValue.loading());

    final result = await AsyncValue.guard(
      () => _postsRepository.getPosts(),
    );

    if (!mounted) return;

    state = state.copyWith(postsUiState: result);
  }

  Future<void> _getPostDetails(String id) async {
    state = state.copyWith(postsUiState: const AsyncValue.loading());

    final result = await AsyncValue.guard(
      () async {
        final post = await _postsRepository.getPostDetails(
          id: int.tryParse(id) ?? 0,
        );

        return [post];
      },
    );

    if (!mounted) return;

    state = state.copyWith(postsUiState: result);
  }

  void onSearch(String value) {
    _searchValue = value;

    _debouncer?.cancel();
    _debouncer = Timer(const Duration(milliseconds: 500), () async {
      if (_searchValue.isEmpty) {
        await _getPosts();
      } else {
        await _getPostDetails(_searchValue);
      }
    });
  }
}

@freezed
class PostListUiState with _$PostListUiState {
  const factory PostListUiState({
    @Default(AsyncValue.loading()) AsyncValue<List<PostResponse>> postsUiState,
  }) = _PostListUiState;
}
