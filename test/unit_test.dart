import 'package:product_list_app/core/viewmodels/home_model.dart';
import 'package:product_list_app/locator.dart';
import 'package:test/test.dart';

void main() {
  test("Testing", () {
    setUpLocator();
    final model = HomeModel();
    print(model.getProducts());
  });
}
