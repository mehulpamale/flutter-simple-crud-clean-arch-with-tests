import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ProductListObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint("change: $change");
  }
}
