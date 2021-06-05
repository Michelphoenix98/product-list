import 'package:flutter/foundation.dart';
import 'package:product_list_app/core/models/product.dart';
import 'package:product_list_app/core/services/api.dart';

// ignore: import_of_legacy_library_into_null_safe
import '../../locator.dart';

enum ViewState { Idle, Busy }

class HomeModel extends ChangeNotifier {
  Api _api = locator<Api>();
  ViewState _state = ViewState.Idle;
  List<Product> _product = [];
  List<Product> get product => _product;
  int _currentPage = 0;
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void handleItemSwapped(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final Product item = _product.removeAt(oldIndex);
    _product.insert(newIndex, item);
    notifyListeners();
  }

  Future<void> handleItemCreated([int index = 0, int size = 10]) async {
    var itemPosition = index + 1;
    var requestMoreData = itemPosition % size == 0 && itemPosition != 0;
    var pageToRequest = itemPosition ~/ size;
    if (requestMoreData && pageToRequest > _currentPage) {
      _currentPage = pageToRequest;
      var data = await _api.getProducts(_currentPage);
      if (data != null) {
        _product.addAll(data.toList());
        notifyListeners();
      }
    }
  }

  Future<List<Product>?> getProducts(
      [int pageNumber = 0, int size = 10]) async {
    setState(ViewState.Busy);
    var products = await _api.getProducts(pageNumber, size);
    _product = [..._product, ...?products];
    setState(ViewState.Idle);
    return products == null ? null : products.toList();
  }
}
