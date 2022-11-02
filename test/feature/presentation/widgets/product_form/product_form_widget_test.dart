import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
    Widget widgetToTest = MaterialApp(
      home: Scaffold(
        body: ProductForm(onSubmit: (_) {}),
      ),
    );

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
  });
}
