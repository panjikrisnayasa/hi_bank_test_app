import 'package:flutter/material.dart';
import 'package:hi_bank_test_app/app/localizations/localizations_extension.dart';

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.localizations.loading),
    );
  }
}
