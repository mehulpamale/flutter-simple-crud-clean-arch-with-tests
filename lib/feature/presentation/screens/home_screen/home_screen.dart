import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:product_crud_demo/feature/presentation/bloc/product_list_bloc/product_list_bloc.dart';
import 'package:product_crud_demo/feature/presentation/stores/app_store.dart';

import '../../widgets/product_card.dart';
import '../add_product_screen/add_product_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _productListStore = ProductListStore();

  @override
  Widget build(BuildContext context) {
    void onButtonPressed() {
      Get.to(() => const AddProductScreen());
    }

    void fetchProducts() {
      // context.read<ProductListBloc>().add(ProductListRequested());
      _productListStore.clearRecords();
      _productListStore.fetchProducts();
    }

    if (context.read<ProductListBloc>().state is ProductListInitial) {
      fetchProducts();
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
          Observer(
            builder: (context) {
              if (_productListStore.records?.status == FutureStatus.fulfilled) {
                final records = _productListStore.records!.value!;
                return Expanded(
                  child: ListView.builder(
                      itemCount: records.length,
                      itemBuilder: (c, i) => ProductCard(
                          productEntity: records[i])),
                );
              } else if (_productListStore.records?.status ==
                  FutureStatus.pending) {
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
