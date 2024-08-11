import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_bank_test_app/app_controller.dart';
import 'package:hi_bank_test_app/features/sign_in/sign_in_screen.dart';
import 'package:hi_bank_test_app/features/top_level_screen/top_level_screen.dart';

final _controller = AppController.provider;

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignedIn = ref.read(_controller).isSignedIn;

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(color: Colors.blue),
        useMaterial3: true,
      ),
      home: isSignedIn ? const TopLevelScreen() : const SignInScreen(),
    );
  }
}
