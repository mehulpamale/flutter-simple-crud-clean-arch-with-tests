import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_crud_demo/app_toast.dart';

void main() {
  const message = "message";
  late Widget widgetToTest;
  setUp(() {
    widgetToTest = const MaterialApp(
      home: Scaffold(),
    );
  });

  testWidgets("renders toast with given message", (widgetTester) async {
    await widgetTester.pumpWidget(widgetToTest);
    await widgetTester.pumpAndSettle();
    AppToast.showSuccess(message);
    await expectLater(find.text(message, findRichText: true), findsOneWidget);
  });
}
