import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_crud_demo/feature/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:product_crud_demo/feature/presentation/widgets/ProductCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) => Scaffold(
            appBar: AppBar(title: const Text("Products")),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: controller.loading
                      ? const CircularProgressIndicator()
                      : ListView.separated(
                          itemCount: controller.products.length,
                          separatorBuilder: (c, i) => const Divider(),
                          itemBuilder: (c, i) => ProductCard(
                              productEntity: controller.products[i])),
                ),
                ElevatedButton(
                    onPressed: controller.onButtonPressed,
                    child: const Text("Add Product"))
              ],
            )));
  }
}
