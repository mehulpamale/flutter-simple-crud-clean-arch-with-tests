import 'package:flutter_test/flutter_test.dart';
import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/data/remote/hive/models/product_hive_model.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';

void main() {
  test(
      "ProductEntity to ProductHiveModel: conversion from business object to implementation object",
      () {
    var date = DateTime.now().toString();
    var object = ProductHiveModel(
      description: "description",
      id: "id",
      name: "name",
      category: "industrial",
      createdAt: date,
    );
    var actual = object.toProductEntity();
    var expected = ProductEntity(
        id: "id",
        name: "name",
        category: ProductCategory.industrial,
        createdAt: date,
        description: "description");
    expect(actual.id, expected.id);
    expect(actual.description, expected.description);
    expect(actual.name, expected.name);
    expect(actual.category, expected.category);
    expect(actual.createdAt, expected.createdAt);
  });

  test(
      "ProductHiveModel to ProductEntity: conversion from implementation object to business object",
      () {
    var date = DateTime.now().toString();
    var object = ProductEntity(
      description: "description",
      id: "id",
      name: "name",
      category: ProductCategory.industrial,
      createdAt: date,
    );
    var actual = ProductHiveModel.fromProductEntity(object);
    var expected = ProductHiveModel(
        id: "id",
        name: "name",
        category: "industrial",
        createdAt: date,
        description: "description");
    expect(actual.id, expected.id);
    expect(actual.description, expected.description);
    expect(actual.name, expected.name);
    expect(actual.category, expected.category);
    expect(actual.createdAt, expected.createdAt);
  });
}
