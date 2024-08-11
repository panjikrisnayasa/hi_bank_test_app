import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hi_bank_test_app/app/services/firebase_auth_service.dart';

part 'sign_in_controller.freezed.dart';

class SignInController extends StateNotifier<SignInUiState> {
  SignInController(this._authService) : super(const SignInUiState());

  static final provider =
      StateNotifierProvider.autoDispose<SignInController, SignInUiState>(
    (ref) => SignInController(
      ref.watch(FirebaseAuthService.provider),
    ),
  );

  final FirebaseAuthService _authService;

  Future<void> signIn({
    VoidCallback? onSuccess,
    VoidCallback? onFailed,
  }) async {
    state = state.copyWith(
      signInSuccessUiState: const AsyncValue.loading(),
    );

    final result = await AsyncValue.guard(
      () async => await _authService.signInWithGoogle(),
    );

    if (result is AsyncData) {
      state = state.copyWith(
        signInSuccessUiState: const AsyncValue.data(true),
      );

      onSuccess?.call();
    } else {
      final error = result.error;

      state = state.copyWith(
        signInSuccessUiState: const AsyncValue.data(false),
      );

      if (error is! AssertionError) {
        onFailed?.call();
      }
    }
  }
}

@freezed
class SignInUiState with _$SignInUiState {
  const factory SignInUiState({
    @Default(AsyncValue.data(false)) AsyncValue<bool> signInSuccessUiState,
  }) = _SignInUiState;
}
