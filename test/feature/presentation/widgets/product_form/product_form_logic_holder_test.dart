import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';
import 'package:product_crud_demo/feature/presentation/widgets/product_form/product_form_logic_holder.dart';

void main() {
  test("calls onSubmit with correct ProductEntity", () async {
    Completer<ProductEntity> completer = Completer();

    String category = ProductCategory.consumer.name;
    String name = "name";
    String description = "description";
    String id = "id";

    final holder = ProductFormLogicHolder((productEntity) {
      completer.complete(productEntity);
    })
      ..idTEC = TextEditingController(text: id)
      ..descriptionTEC = TextEditingController(text: description)
      ..nameTEC = TextEditingController(text: name)
      ..category = category;
    holder.onSubmit();

    final completerResult = await completer.future;

    expect(completerResult.category.name, category);
    expect(completerResult.name, name);
    expect(completerResult.description, description);
    expect(completerResult.id, id);
  });
}
