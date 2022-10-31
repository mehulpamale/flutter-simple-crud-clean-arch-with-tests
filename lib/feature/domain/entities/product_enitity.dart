import 'package:equatable/equatable.dart';
import 'package:product_crud_demo/enums/product_category.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String createdAt;
  final ProductCategory category;
  final String? description;

  const ProductEntity(
      {this.description,
      required this.id,
      required this.name,
      required this.category,
      required this.createdAt});

  @override
  List<Object?> get props => [name, id, createdAt, category, description];
}
