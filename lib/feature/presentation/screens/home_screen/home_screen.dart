import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:product_crud_demo/feature/presentation/bloc/product_list_bloc/product_list_bloc.dart';

import '../../widgets/product_card.dart';
import '../add_product_screen/add_product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onButtonPressed() {
      Get.to(() => const AddProductScreen());
    }

    void fetchProducts() {
      context.read<ProductListBloc>().add(ProductListRequested());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(onPressed: fetchProducts, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<ProductListBloc, ProductListState>(
            builder: (context, state) {
              if (state is ProductListLoaded) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (c, i) =>
                          ProductCard(productEntity: state.products[i])),
                );
              } else if (state is ProductListLoading) {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              } else {
                return Container();
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onButtonPressed,
        tooltip: "Add Product",
        child: const Icon(Icons.add),
      ),
    );
  }
}
