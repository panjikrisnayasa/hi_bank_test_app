import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_bank_test_app/app/localizations/localizations_extension.dart';
import 'package:hi_bank_test_app/app/widgets/error_state_widget.dart';
import 'package:hi_bank_test_app/app/widgets/loading_state_widget.dart';
import 'package:hi_bank_test_app/features/sign_in/sign_in_controller.dart';
import 'package:hi_bank_test_app/features/top_level_screen/top_level_screen.dart';

final _controller = SignInController.provider;

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localizations.postApp,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Consumer(
            builder: (context, ref, child) {
              final signInSuccessUiState = ref.watch(
                _controller.select((value) => value.signInSuccessUiState),
              );

              return signInSuccessUiState.when(
                data: (data) {
                  if (data) {
                    return const LoadingStateWidget();
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.localizations.welcome,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        child: Text(context.localizations.signInWithGoogle),
                        onPressed: () => ref.read(_controller.notifier).signIn(
                              onSuccess: () =>
                                  _navigateToTopLevelScreen(context),
                              onFailed: () =>
                                  _showSignInFailedSnackBar(context),
                            ),
                      )
                    ],
                  );
                },
                error: (_, __) {
                  return const ErrorStateWidget();
                },
                loading: () {
                  return const LoadingStateWidget();
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _navigateToTopLevelScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const TopLevelScreen(),
      ),
      (route) => false,
    );
  }

  void _showSignInFailedSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.localizations.signInFailed),
      ),
    );
  }
}
