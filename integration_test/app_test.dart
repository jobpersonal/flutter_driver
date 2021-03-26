import 'package:driver_app/main.dart';
import 'package:driver_app/src/pages/display.dart';
import 'package:driver_app/src/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "Not inputting text and wanting to go to the display page shows "
    "an error and prevents from going to the display page.",
    (WidgetTester tester) async {
        await tester.pumpWidget(MyApp());

        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();

        expect(find.byType(Home), findsOneWidget);
        expect(find.byType(Display), findsNothing);
        expect(find.text('Input cannot be empty!'), findsOneWidget);
    }
  );

  testWidgets(
    "After inputting text, go to the display page which contains that same text, "
    "and then navigate back to the home page where the input should be clear.",
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      const String _inputText = 'Input text, testing!';
      await tester.enterText(find.byKey(Key('inputField')), _inputText);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      
      expect(find.byType(Home), findsNothing);
      expect(find.byType(Display), findsOneWidget);
      expect(find.text(_inputText), findsOneWidget);

      await tester.tap(find.byType(BackButton));

      expect(find.byType(Home), findsOneWidget);
      expect(find.byType(Display), findsNothing);
      expect(find.text(_inputText), findsNothing);
    }
  );
}