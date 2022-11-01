import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';

class ProductFormController extends GetxController {
  var idTEC = TextEditingController();
  var nameTEC = TextEditingController();
  var descriptionTEC = TextEditingController();
  String? category;

  String? isRequiredStringValidator(String? text, String fieldName) {
    return text == null || text.isEmpty ? "$fieldName is required" : null;
  }

  String? idValidator(String? text) => isRequiredStringValidator(text, "Id");

  String? nameValidator(String? text) =>
      isRequiredStringValidator(text, "Name");

  String? descrValidator(String? text) =>
      isRequiredStringValidator(text, "Description");

  String? categoryValidator(String? text) =>
      isRequiredStringValidator(text, "Category");

  final Function(ProductEntity productEntity) _onSubmit;

  ProductFormController(this._onSubmit);

  var formKey = GlobalKey<FormState>();

  void onRadioChanged(Object? o) {
    log("o: ${o}");
    category = o as String;
    update();
  }

  onSubmit() {
    var prod = ProductEntity(
        id: idTEC.value.text,
        name: nameTEC.value.text,
        category: ProductCategory.values
            .firstWhere((element) => element.name == category),
        description: descriptionTEC.value.text,
        createdAt: DateTime.now().toString());
    _onSubmit(prod);
  }
}
