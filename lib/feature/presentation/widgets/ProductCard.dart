import 'package:flutter/material.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductCard({Key? key, required this.productEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Table(children: [
          TableRow(children: [const Text("name"), Text(productEntity.name)]),
          TableRow(children: [
            const Text("createdAt"),
            Text(productEntity.createdAt)
          ]),
          TableRow(children: [const Text("id"), Text(productEntity.id)]),
          TableRow(children: [
            const Text("category"),
            Text(productEntity.category.name)
          ]),
          TableRow(children: [
            const Text("description"),
            Text(productEntity.description ?? "")
          ]),
        ]),
      ),
    );
  }
}
