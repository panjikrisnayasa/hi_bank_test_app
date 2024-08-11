import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_level_controller.freezed.dart';

class TopLevelController extends StateNotifier<TopLevelUiState> {
  TopLevelController() : super(const TopLevelUiState());

  static final provider =
      StateNotifierProvider.autoDispose<TopLevelController, TopLevelUiState>(
    (ref) => TopLevelController(),
  );

  void onTabChanged(int index) {
    state = state.copyWith(currentTabIndex: index);
  }
}

@freezed
class TopLevelUiState with _$TopLevelUiState {
  const factory TopLevelUiState({
    @Default(0) int currentTabIndex,
  }) = _TopLevelUiState;
}
