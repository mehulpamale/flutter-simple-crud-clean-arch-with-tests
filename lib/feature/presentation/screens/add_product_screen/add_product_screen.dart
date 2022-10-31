import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_crud_demo/feature/presentation/widgets/product_form/product_form_widget.dart';

import 'add_product_screen_controller.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductScreenController>(
        init: AddProductScreenController(),
        builder: (controller) => Scaffold(
            appBar: AppBar(title: const Text("Products")),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductForm(
                  onSubmit: (productEntity) =>
                      controller.onSubmit(productEntity)),
            )));
  }
}
