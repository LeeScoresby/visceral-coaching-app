import 'package:flutter_test/flutter_test.dart';

import 'package:visceral_coaching_app/main.dart';

void main() {
  testWidgets('App displays Visceral text', (WidgetTester tester) async {
    await tester.pumpWidget(const VisceralApp());

    expect(find.text('Visceral'), findsOneWidget);
  });
}
