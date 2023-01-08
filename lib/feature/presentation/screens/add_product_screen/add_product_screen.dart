import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:product_crud_demo/feature/presentation/bloc/product_list_bloc/product_list_bloc.dart';
import 'package:product_crud_demo/feature/presentation/widgets/product_form/product_form_widget.dart';

import '../../../../app_toast.dart';
import '../../bloc/product_form_bloc/product_form_bloc.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add Product")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocListener<ProductFormBloc, ProductFormState>(
            listener: (context, state) {
              if (state is ProductFormSubmitted) {
                context.read<ProductListBloc>().add(ProductListRequested());
                Get.back();
                AppToast.showSuccess("Product added successfully");
              }
            },
            child: ProductForm(
                onSubmit: (productEntity) => context
                    .read<ProductFormBloc>()
                    .add(ProductFormSubmitRequested(productEntity))),
          ),
        ));
  }
}
