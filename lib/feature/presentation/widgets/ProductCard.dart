import 'package:flutter/material.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductCard({Key? key, required this.productEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(children: [
      TableRow(children: [const Text("name"), Text(productEntity.name)])
    ]);
  }
}
