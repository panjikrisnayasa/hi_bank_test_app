import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_bank_test_app/app/data/posts/model/post_response.dart';
import 'package:hi_bank_test_app/app/localizations/localizations_extension.dart';
import 'package:hi_bank_test_app/app/widgets/empty_data_widget.dart';
import 'package:hi_bank_test_app/app/widgets/error_state_widget.dart';
import 'package:hi_bank_test_app/app/widgets/loading_state_widget.dart';
import 'package:hi_bank_test_app/features/post_list/post_list_controller.dart';
import 'package:hi_bank_test_app/features/post_list/widgets/post_card.dart';

class PostListScreen extends ConsumerStatefulWidget {
  const PostListScreen({super.key});

  @override
  ConsumerState<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends ConsumerState<PostListScreen>
    with AutomaticKeepAliveClientMixin {
  final _controller = PostListController.provider;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(_controller.notifier).onScreenLoaded();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localizations.postList,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _searchBar(),
            _postsUiState(),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        key: const Key('search_field'),
        decoration: InputDecoration(
          hintText: context.localizations.searchPostById,
          hintStyle: const TextStyle(
            color: Colors.black38,
          ),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        textInputAction: TextInputAction.search,
        onChanged: ref.read(_controller.notifier).onSearch,
      ),
    );
  }

  Widget _postsUiState() {
    return Expanded(
      child: Consumer(
        builder: (_, ref, child) {
          final postsUiState = ref.watch(
            _controller.select((value) => value.postsUiState),
          );

          return postsUiState.when(
            data: (data) {
              if (data.isEmpty) {
                return const EmptyDataWidget();
              }

              return _postList(data);
            },
            error: (_, __) {
              return ErrorStateWidget(
                onRetry: ref.read(_controller.notifier).onReload,
              );
            },
            loading: () {
              return const LoadingStateWidget();
            },
          );
        },
      ),
    );
  }

  Widget _postList(List<PostResponse> data) {
    return ListView.builder(
      key: const Key('post_list'),
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 4,
        bottom: 16,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final post = data[index];

        return PostCard(
          key: Key('post_item_${post.id}'),
          data: post,
        );
      },
    );
  }
}
