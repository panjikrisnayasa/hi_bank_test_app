import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_bank_test_app/app/localizations/localizations_extension.dart';
import 'package:hi_bank_test_app/features/account/account_controller.dart';
import 'package:hi_bank_test_app/features/sign_in/sign_in_screen.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen>
    with AutomaticKeepAliveClientMixin {
  final _controller = AccountController.provider;

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
          context.localizations.account,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 40,
          ),
          child: Consumer(
            builder: (context, ref, child) {
              final user = ref.watch(_controller.select((value) => value.user));

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (user == null)
                    Center(
                      child: Text(
                        context.localizations.userNotFound,
                        textAlign: TextAlign.center,
                      ),
                    )
                  else ...[
                    if (user.photoURL != null) ...[
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Image.network(
                            user.photoURL!,
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                    Text(
                      user.displayName ?? '-',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user.email ?? '-',
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _showSignOutDialog,
                    child: Text(context.localizations.signOut),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _showSignOutDialog() {
    void navigateToSignIn() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ),
        (route) => false,
      );
    }

    void showFailedSnackBar() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.localizations.signOutFailed),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.localizations.signOut),
          content: Text(context.localizations.signOutConfirmation),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(context.localizations.cancel),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                await ref.read(_controller.notifier).signOut(
                      onSuccess: navigateToSignIn,
                      onFailed: () {
                        Navigator.pop(context);
                        showFailedSnackBar();
                      },
                    );
              },
              child: Text(context.localizations.signOut),
            ),
          ],
        );
      },
    );
  }
}
