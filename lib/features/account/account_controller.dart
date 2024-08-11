import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hi_bank_test_app/app/services/firebase_auth_service.dart';

part 'account_controller.freezed.dart';

class AccountController extends StateNotifier<AccountUiState> {
  AccountController(
    this._authService,
  ) : super(const AccountUiState());

  static final provider =
      StateNotifierProvider.autoDispose<AccountController, AccountUiState>(
    (ref) => AccountController(
      ref.watch(FirebaseAuthService.provider),
    ),
  );

  final FirebaseAuthService _authService;

  void onScreenLoaded() {
    _getCurrentUser();
  }

  void _getCurrentUser() {
    final user = _authService.getCurrentUser;

    if (!mounted) return;

    state = state.copyWith(user: user);
  }

  Future<void> signOut({
    required VoidCallback onSuccess,
    required VoidCallback onFailed,
  }) async {
    final isSignedOut = await _authService.signOutFromGoogle();

    if (!mounted) return;

    state = state.copyWith(user: null);

    if (isSignedOut) {
      onSuccess();
    } else {
      onFailed();
    }
  }
}

@freezed
class AccountUiState with _$AccountUiState {
  const factory AccountUiState({
    User? user,
  }) = _AccountUiState;
}
