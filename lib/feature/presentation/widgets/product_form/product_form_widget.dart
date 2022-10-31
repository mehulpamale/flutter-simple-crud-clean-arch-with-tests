import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/presentation/widgets/product_form/product_form_controller.dart';

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
          child: Column(children: [
        TextField(
          decoration: const InputDecoration(labelText: "name"),
          controller: c.nameTEC,
        ),
        TextField(
          decoration: const InputDecoration(labelText: "description"),
          controller: c.descriptionTEC,
        ),
        TextField(
          decoration: const InputDecoration(labelText: "id"),
          controller: c.idTEC,
        ),
        Row(
          children: [
            Radio(
              value: ProductCategory.consumer,
              groupValue: c.category,
              onChanged: c.onRadioChanged,
            ),
            const Text("consumer"),
            Radio(
              value: ProductCategory.industrial,
              groupValue: c.category,
              onChanged: c.onRadioChanged,
            ),
            const Text("industrial")
          ],
        ),
        ElevatedButton(
            onPressed: () {
              c.onSubmit();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Your Text"),
                duration: Duration(milliseconds: 300),
              ));
            },
            child: const Text("Add"))
      ])),
    );
  }
}
