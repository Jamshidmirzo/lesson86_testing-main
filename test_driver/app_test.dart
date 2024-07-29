import 'package:flutter_driver/flutter_driver.dart' as d;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group("Calculator Test", () {
    // final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    // binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    late d.FlutterDriver driver;

    setUpAll(() async {
      driver = await d.FlutterDriver.connect();
    });

    tearDownAll(() async {
      await driver.close();
    });

    test("Calculatorni textfield va button'lar ishlashini tekshirish",
        () async {
      final aTextField = d.find.byValueKey("a");
      final bTextField = d.find.byValueKey("b");

      // expect(aTextField, findsOneWidget);
      // expect(bTextField, findsOneWidget);

      await driver.tap(aTextField);
      await driver.enterText("5");

      await driver.tap(bTextField);
      await driver.enterText("10");

      // Knopkani bosib tekshirib ko'ramiz
      final plusButton = d.find.byValueKey("+");
      await driver.tap(plusButton);

      final resultHolder = d.find.byValueKey("result");
      expect(await driver.getText(resultHolder), "Result: 15");
    });
  });
}
