import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_crud_demo/main.dart' as app;
import 'package:product_crud_demo/widget_keys.dart';

main() {
  testWidgets("Product should be saved after it is added successfully",
      (widgetTester) async {
    // Widget widgetToTest = const MaterialApp(
    //   home: Scaffold(
    //     body: HomeScreen(),
    //   ),
    // );
    // await widgetTester.pumpWidget(widgetToTest);
    app.main();
    await widgetTester.pumpAndSettle(
      const Duration(milliseconds: 100),
      EnginePhase.sendSemanticsUpdate,
      const Duration(seconds: 30),
    );

    await widgetTester.tap(find.widgetWithText(ElevatedButton, "Add Product"));
    await widgetTester.pumpAndSettle();

    await widgetTester.enterText(
        find.widgetWithText(TextFormField, "name"), "tata  salt");
    await widgetTester.enterText(
        find.widgetWithText(TextFormField, "description"), "desh ka namak");
    await widgetTester.enterText(
        find.widgetWithText(TextFormField, "id"), "tata01");
    await widgetTester
        .tap(find.byKey(const Key(WidgetKeys.productFormRadioConsumer)));

    await widgetTester.tap(find.widgetWithText(ElevatedButton, "Add"));
    await widgetTester.pumpAndSettle();

    expect(find.text("tata  salt"), findsOneWidget);
    expect(find.text("desh ka namak"), findsOneWidget);
    expect(find.text("tata01"), findsOneWidget);
    expect(find.text("consumer"), findsOneWidget);
  });
}
