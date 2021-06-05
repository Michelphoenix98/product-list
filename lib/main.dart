import 'package:flutter/material.dart';
import 'package:product_list_app/locator.dart';
import 'package:product_list_app/ui/views/home_view.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      home: HomeView(),
    );
  }
}
