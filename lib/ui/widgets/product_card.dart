import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product_list_app/core/viewmodels/home_model.dart';
import 'package:product_list_app/ui/constants/symbols.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final int index;
  const ProductCard({required this.index});
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<HomeModel>(context).product[index];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: model.thumbnail != null
                  ? CachedNetworkImage(
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      imageUrl: model.thumbnail,
                      width: MediaQuery.of(context).size.width / 3.6,
                      height: MediaQuery.of(context).size.height / 8.16,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width / 3.6,
                      height: MediaQuery.of(context).size.height / 8.16,
                      child: Icon(
                        Icons.image,
                        color: Colors.grey,
                      ),
                    ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Text(
                      model.displayName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "M.R.P $rupee : ${model.maximumRetailPrice}",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Sale price $rupee : ${model.salePrice}"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
