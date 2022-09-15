import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  const ProductDetailScreen({super.key});

  static const routeName = "/product-detail";
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final productData = Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title),
      ),
    );
  }
}
