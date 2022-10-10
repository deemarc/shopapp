import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  // final Product product;

  // const  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return GridTile(
      footer: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (ctx, product, child) {
              return IconButton(
                icon: Icon(product.isFavourite == true
                    ? Icons.favorite
                    : Icons.favorite_outline),
                color: Theme.of(context).accentColor,
                onPressed: () => {product.toggleFavouriteStatus()},
              );
            }
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
              // Scaffold.of(context).showSnackBar(snackbar);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text(
                  "Added item to cart!",
                  textAlign: TextAlign.center,
                ),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(label: 'UNDO', onPressed: (){
                  cart.removeSingleItem(product.id);

                }),
              ));
            },
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
