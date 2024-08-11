import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hi_bank_test_app/app/widgets/error_state_widget.dart';

import '../../utils/test_app.dart';

void main() {
  testWidgets('ErrorStateWidget should show correct content', (tester) async {
    await tester.pumpScreen();

    expect(find.text('Gagal mengambil data'), findsOneWidget);

    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Coba Lagi'), findsOneWidget);
  });
}

extension _WidgetTesterExtension on WidgetTester {
  Future<void> pumpScreen() async {
    binding.platformDispatcher.textScaleFactorTestValue = 0.1;

    await pumpWidget(
      const TestApp(
        child: ErrorStateWidget(),
      ),
    );

    await pumpAndSettle();
  }
}
