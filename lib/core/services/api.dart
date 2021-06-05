import 'dart:convert';

import 'package:product_list_app/core/models/product.dart';
import 'package:http/http.dart' as http;

class Api {
  static const endpoint = 'https://api.shoopy.in';

  Future<Iterable<Product>?> getProducts(
      [int pageNumber = 0, int size = 10]) async {
    final arguments =
        'online-only=true&child-cat-products=true&page=$pageNumber&size=$size&sort=qty,desc';
    final url =
        Uri.parse('$endpoint/api/v1/org/28052/super-products?$arguments');

    http.Response response = await http.get(url);
    print('status code:${response.statusCode}');
    return json
        .decode(utf8.decode(response.bodyBytes))["payload"]["content"]
        .where((element) {
      return element != null;
    }).map<Product>((element) {
      return Product.fromJson(element);
    });
  }
}
