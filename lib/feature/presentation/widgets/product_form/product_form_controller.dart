import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';

class ProductFormController extends GetxController {
  var idTEC = TextEditingController();
  var nameTEC = TextEditingController();
  var descriptionTEC = TextEditingController();
  var category = ProductCategory.consumer;

  final Function(ProductEntity productEntity) _onSubmit;

  ProductFormController(this._onSubmit);

  void onRadioChanged(Object? o) {
    log("o: ${o}");
    category = o as ProductCategory;
    update();
  }

  onSubmit() {
    var prod = ProductEntity(
        id: idTEC.value.text,
        name: nameTEC.value.text,
        category: category,
        createdAt: DateTime.now().toString());
    _onSubmit(prod);
  }
}
