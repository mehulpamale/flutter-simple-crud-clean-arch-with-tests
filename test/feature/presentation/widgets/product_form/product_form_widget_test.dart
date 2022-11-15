import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:product_crud_demo/feature/presentation/widgets/product_form/product_form_widget.dart';
import 'package:product_crud_demo/widget_keys.dart';

void main() {
  group("product form validation test -- negative tests", () {
    Widget widgetToTest = MaterialApp(
      home: Scaffold(
        body: ProductForm(onSubmit: (_) {}),
      ),
    );

    testWidgets("validation should not be performed until interaction is done",
        (WidgetTester tester) async {
      await tester.pumpWidget(widgetToTest);
      expect(find.text("is required"), findsNothing);
    });

    testWidgets("Name should not be empty", (WidgetTester tester) async {
      await tester.pumpWidget(widgetToTest);
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text("Name is required"), findsOneWidget);
    });

    testWidgets("Description should not be empty", (WidgetTester tester) async {
      await tester.pumpWidget(widgetToTest);
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text("Description is required"), findsOneWidget);
    });

    testWidgets("Id should not be empty", (WidgetTester tester) async {
      await tester.pumpWidget(widgetToTest);
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text("Id is required"), findsOneWidget);
    });

    testWidgets("Category should not be empty", (WidgetTester tester) async {
      await tester.pumpWidget(widgetToTest);
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text("Category is required"), findsOneWidget);
    });
  });

  group("product form validation test -- positive tests", () {
    Completer completer = Completer();
    Widget widgetToTest = GetMaterialApp(
        home: Material(child: ProductForm(onSubmit: completer.complete)));

    testWidgets("Name should not be empty", (WidgetTester tester) async {
      await tester.pumpWidget(widgetToTest);
      await tester.enterText(
          find.byKey(const Key(WidgetKeys.productFormNameTff)), "Name");
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text("Name is required"), findsNothing);
    });

    testWidgets("Description should not be empty", (WidgetTester tester) async {
      await tester.pumpWidget(widgetToTest);
      await tester.enterText(
          find.byKey(const Key(WidgetKeys.productFormDescriptionTff)),
          "Description");
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text("Description is required"), findsNothing);
    });

    testWidgets("Id should not be empty", (WidgetTester tester) async {
      await tester.pumpWidget(widgetToTest);
      await tester.enterText(
          find.byKey(const Key(WidgetKeys.productFormIdTff)), "Id");
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text("Id is required"), findsNothing);
    });

    testWidgets("Category should not be empty", (WidgetTester tester) async {
      await tester.pumpWidget(widgetToTest);
      await tester.tap(find.text("consumer"));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text("Category is required"), findsNothing);
    });

    testWidgets("positive: successfully submit the form", (widgetTester) async {
      await widgetTester.pumpWidget(widgetToTest);
      await widgetTester.enterText(
          find.byKey(const Key(WidgetKeys.productFormNameTff)), "Name");
      await widgetTester.enterText(
          find.byKey(const Key(WidgetKeys.productFormDescriptionTff)),
          "Description");
      await widgetTester.enterText(
          find.byKey(const Key(WidgetKeys.productFormIdTff)), "Id");
      await widgetTester.tap(find.text("consumer"));
      await widgetTester.tap(find.byType(ElevatedButton));
      await widgetTester.pumpAndSettle();
      expectLater(completer.isCompleted, true);
    });
  });
}
