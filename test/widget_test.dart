import 'package:flutter_test/flutter_test.dart';
import 'package:mini_cricket/main.dart';

void main() {
  testWidgets('Mini Cricket starts with 6 balls and 0 runs',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MiniCricketApp());

    expect(find.text('Mini Cricket'), findsOneWidget);
    expect(find.text('Runs'), findsOneWidget);
    expect(find.text('Balls'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('6'), findsOneWidget);
    expect(find.text('No Runs'), findsOneWidget);
    expect(find.text('Bat'), findsOneWidget);
  });
}
