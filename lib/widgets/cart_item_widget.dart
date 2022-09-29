import 'package:flutter/material.dart';
import '../providers/cart_item.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(cartItem.id),
        direction: DismissDirection.endToStart,
        onDismissed: (direction){
          Provider.of<Cart>(context,listen: false).removeItem(cartItem.productId,);
        },
        background: Container(
          color: Theme.of(context).errorColor,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                  key: Key(cartItem.id),
                  child: FittedBox(
                    child: Text("\$${cartItem.price}"),
                  )),
              title: Text(cartItem.title),
              subtitle: Text(
                  'Subtotal: \$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}'),
              trailing: Text('${cartItem.quantity} x'),
            ),
          ),
        ));
  }
}
