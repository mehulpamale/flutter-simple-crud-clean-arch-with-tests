import 'package:flutter_test/flutter_test.dart';
import 'package:product_crud_demo/feature/presentation/bloc/product_form_bloc/product_form_bloc.dart';

import '../../../../test_config/objects.dart';

void main() {
  test("two ProductFormEvent should be equal if props are equal", () =>
      expect(ProductFormSubmitRequested(productEntity) ==
          ProductFormSubmitRequested(productEntity),
          true));
}
