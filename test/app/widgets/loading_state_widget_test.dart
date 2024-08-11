import 'package:flutter_test/flutter_test.dart';
import 'package:hi_bank_test_app/app/widgets/loading_state_widget.dart';

import '../../utils/test_app.dart';

void main() {
  testWidgets('LoadingStateWidget should show correct content', (tester) async {
    await tester.pumpScreen();

    expect(find.text('Loading...'), findsOneWidget);
  });
}

extension _WidgetTesterExtension on WidgetTester {
  Future<void> pumpScreen() async {
    binding.platformDispatcher.textScaleFactorTestValue = 0.1;

    await pumpWidget(
      const TestApp(
        child: LoadingStateWidget(),
      ),
    );

    await pumpAndSettle();
  }
}
