import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_crud_demo/app_toast.dart';
import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:product_crud_demo/feature/presentation/widgets/product_form/product_form_controller.dart';
import 'package:product_crud_demo/widget_keys.dart';

import '../../../domain/entities/product_enitity.dart';

class ProductForm extends StatefulWidget {
  final Function(ProductEntity productEntity) onSubmit;

  const ProductForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProductFormController(widget.onSubmit),
      builder: (c) => Form(
          key: c.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(children: [
            TextFormField(
              key: const Key(WidgetKeys.productFormNameTff),
              validator: c.nameValidator,
              decoration: const InputDecoration(labelText: "name"),
              controller: c.nameTEC,
            ),
            TextFormField(
              key: const Key(WidgetKeys.productFormDescriptionTff),
              validator: c.descrValidator,
              decoration: const InputDecoration(labelText: "description"),
              controller: c.descriptionTEC,
            ),
            TextFormField(
              key: const Key(WidgetKeys.productFormIdTff),
              validator: c.idValidator,
              decoration: const InputDecoration(labelText: "id"),
              controller: c.idTEC,
            ),
            Row(
              children: [
                Radio(
                  key: const Key(WidgetKeys.productFormRadioConsumer),
                  value: ProductCategory.consumer.name,
                  groupValue: c.category,
                  onChanged: c.onRadioChanged,
                ),
                const Text("consumer"),
                Radio(
                  key: const Key(WidgetKeys.productFormRadioIndustrial),
                  value: ProductCategory.industrial.name,
                  groupValue: c.category,
                  onChanged: c.onRadioChanged,
                ),
                const Text("industrial")
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  if (!(c.formKey.currentState?.validate() ?? false)) {
                    AppToast.showError("Please check form errors");
                    return;
                  }
                  c.onSubmit();
                  AppToast.showSuccess("Product added successfully");
                  Get.find<HomeScreenController>().fetchProducts();
                  Get.back();
                },
                child: const Text("Add"))
          ])),
    );
  }
}
