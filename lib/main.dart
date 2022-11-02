import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:product_crud_demo/feature/data/remote/hive/models/product_hive_model.dart';
import 'package:product_crud_demo/feature/presentation/screens/home_screen/home_screen.dart';

import 'injection_container.dart' as di;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductHiveModelAdapter());
  await Hive.openBox("products");
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [FormBuilderLocalizations.delegate],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
