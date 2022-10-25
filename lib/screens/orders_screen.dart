import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/widgets/order_item_widget.dart';
import '../providers/orders.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders";
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ordersData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Orders'),
        ),
        drawer: const AppDrawer(),
        body: FutureBuilder(
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              if (dataSnapshot.error != null) {
                return const Center(
                  child: Text("AN error occured."),
                );
              } else {
                return Consumer<Orders>(
                    builder: (ctx, orderData, child) => ListView.builder(
                          itemBuilder: (ctx, i) =>
                              OrderItemWidget(order: orderData.orders[i]),
                          itemCount: orderData.orders.length,
                        ));
              }
            }
          },
          future:
              Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        ));
  }
}
