import 'package:flutter_test/flutter_test.dart';

import 'package:lesson86_testing/controller/calculator.dart';

void main() {
  group("Calculator funksiyalarini test qilish: ", () {
    test("Kalkulyatorni qo'shish funksiyasini tekshirish: ", () {
      final calculator = Calculator();

      int result = calculator.add(7, 9); // 16
      expect(result, 16);
      expect(calculator.add(-9, 6), equals(-3));
      expect(calculator.add(2, 1), equals(3));
      expect(calculator.add(8, 5), equals(13));
      expect(calculator.add(2, 0), equals(2));
    });

    test("Kalkulyatorni ayirish funksiyasini tekshirish: ", () {
      final calculator = Calculator();

      int result = calculator.subtract(7, 9); // 16
      expect(result, -2);
      expect(calculator.subtract(-9, 6), equals(-15));
      expect(calculator.subtract(2, 1), equals(1));
      expect(calculator.subtract(8, 5), equals(3));
      expect(calculator.subtract(2, 0), equals(2));
    });
  });
}
