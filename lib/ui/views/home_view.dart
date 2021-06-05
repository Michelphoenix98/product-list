import 'package:flutter/material.dart';
import 'package:product_list_app/core/viewmodels/home_model.dart';
import 'package:product_list_app/locator.dart';
import 'package:product_list_app/ui/widgets/product_card.dart';
import 'package:product_list_app/ui/widgets/self_aware_list_item.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeModel model = locator<HomeModel>();
  @override
  void initState() {
    model.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (context) => model,
      child: Consumer<HomeModel>(
        builder: (context, model, child) => Scaffold(
          body: model.state == ViewState.Busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: ReorderableListView.builder(
                    itemCount: model.product.length,
                    onReorder: (int oldIndex, int newIndex) {
                      model.handleItemSwapped(oldIndex, newIndex);
                    },
                    itemBuilder: (context, index) {
                      return SelfAwareListItem(
                        key: Key('$index'),
                        itemCreated: () {
                          model.handleItemCreated(index);
                        },
                        child: ProductCard(index: index),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
