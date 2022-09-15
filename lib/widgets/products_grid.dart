import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products_provider.dart';
import 'package:shopapp/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavourite;

  ProductsGrid(this.showFavourite);
  // const ProductsGrid({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showFavourite ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        // the alternate would be SliverGridDelegateWithMaxCrossAxisExtent
        // which fixed the grid item size and would put the appropriate number of grid item
        itemBuilder: (ctx, i) => Center(
                child: ChangeNotifierProvider.value(
              value: products[i],
              // create: (BuildContext context){
              //   return products[i];
              // },
              child: ProductItem(),
            )));
  }
}
