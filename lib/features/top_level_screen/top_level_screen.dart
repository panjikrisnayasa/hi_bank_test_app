import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_bank_test_app/app/localizations/localizations_extension.dart';
import 'package:hi_bank_test_app/features/account/account_screen.dart';
import 'package:hi_bank_test_app/features/post_list/post_list_screen.dart';
import 'package:hi_bank_test_app/features/top_level_screen/top_level_controller.dart';

final _controller = TopLevelController.provider;
final _pageController = PageController();

class TopLevelScreen extends ConsumerWidget {
  const TopLevelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTabIndex = ref.watch(
      _controller.select((value) => value.currentTabIndex),
    );

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          ref.read(_controller.notifier).onTabChanged(value);
          _pageController.jumpToPage(value);
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentTabIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: const Icon(
              Icons.list,
              color: Colors.white,
            ),
            icon: const Icon(Icons.list),
            label: context.localizations.postList,
          ),
          NavigationDestination(
            selectedIcon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            icon: const Icon(Icons.person),
            label: context.localizations.account,
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          PostListScreen(),
          AccountScreen(),
        ],
      ),
    );
  }
}
