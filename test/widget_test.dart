import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lesson86_testing/main.dart';

void main() {
  group("Calculator vidjetlarini testlash", () {
    testWidgets("Calculatorni textfield'lari borligini tekshirish",
        (widgetTester) async {
      // MainApp vidjetini yaratadi
      await widgetTester
          .pumpWidget(const MaterialApp(home: CalculatorScreen()));
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.byKey(const ValueKey("a")), findsOneWidget);
      expect(find.byKey(const ValueKey("b")), findsOneWidget);
    });

    testWidgets("Calculatorni button'lari borligini tekshirish",
        (widgetTester) async {
      // MainApp vidjetini yaratadi
      await widgetTester
          .pumpWidget(const MaterialApp(home: CalculatorScreen()));
      expect(find.byType(FilledButton), findsNWidgets(2));
      expect(find.byKey(const ValueKey("+")), findsOneWidget);
      expect(find.byKey(const ValueKey("-")), findsOneWidget);
    });

    testWidgets("Calculatorni textfield va button'lar ishlashini tekshirish",
        (widgetTester) async {
      // MainApp vidjetini yaratadi
      await widgetTester
          .pumpWidget(const MaterialApp(home: CalculatorScreen()));

      Finder aTextField = find.byKey(const ValueKey("a"));
      Finder bTextField = find.byKey(const ValueKey("b"));

      expect(aTextField, findsOneWidget);
      expect(bTextField, findsOneWidget);

      await widgetTester.enterText(aTextField, "5");
      await widgetTester.enterText(bTextField, "10");

      // Qayta build qiladi
      await widgetTester.pump();

      expect(find.text("5"), findsOneWidget);
      expect(find.text("10"), findsOneWidget);

      // Knopkani bosib tekshirib ko'ramiz
      Finder plusButton = find.byKey(const ValueKey("+"));
      expect(plusButton, findsOneWidget);

      // tab - knopkani bosamiz
      await widgetTester.tap(plusButton);

      // Qayta build qiladi
      await widgetTester.pump();

      expect(find.text("Result: 14"), findsOneWidget);
    });
  });
}
