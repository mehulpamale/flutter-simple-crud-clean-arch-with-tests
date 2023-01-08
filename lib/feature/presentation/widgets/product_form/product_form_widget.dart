import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:product_crud_demo/app_toast.dart';
import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/presentation/widgets/product_form/product_form_logic_holder.dart';
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
    final c = ProductFormLogicHolder(widget.onSubmit);
    return Form(
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
          FormBuilderRadioGroup(
            name: "category",
            decoration: const InputDecoration(labelText: 'Category'),
            validator: c.categoryValidator,
            onChanged: c.onRadioChanged,
            options: ProductCategory.values
                .map((lang) => FormBuilderFieldOption(
                      value: lang.name,
                      child: Text(lang.name),
                    ))
                .toList(growable: false),
          ),
          ElevatedButton(
              onPressed: () {
                if (!(c.formKey.currentState?.validate() ?? false)) {
                  AppToast.showError("Please check form errors");
                  return;
                }
                c.onSubmit();
              },
              child: const Text("Add"))
        ]));
  }
}
