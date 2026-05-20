import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mini_projects/app.dart';

void main() {
  testWidgets('App loads home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const FlutterMiniProjectsApp());

    expect(find.text('Flutter Mini Projects'), findsOneWidget);
    expect(find.text('FizzBuzz with User Input'), findsOneWidget);
  });
}