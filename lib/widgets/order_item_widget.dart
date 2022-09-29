import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopapp/providers/order_item.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderItem order;
  const OrderItemWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${order.amount}"),
            subtitle:
                Text(DateFormat('dd MM yyyy hh:mm:ss').format(order.dateTime)),
            trailing: IconButton(icon: Icon(Icons.expand_more), onPressed: () {

            },),
          )
        ],
      ),
    );
  }
}
