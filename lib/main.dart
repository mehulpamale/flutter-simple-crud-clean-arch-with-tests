import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:product_crud_demo/feature/presentation/screens/home_screen/home_screen.dart';

import 'injection_container.dart' as di;

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("products");
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
