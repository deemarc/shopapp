import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import './order_item.dart';
import './cart_item.dart';

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fecthAndSetOrders() async {
    final url = Uri.parse(
        'https://shopapp-backend-default-rtdb.asia-southeast1.firebasedatabase.app/orders.json');
    final response = await http.get(url);
    // print(json.decoder(response.body));
  }

  Future<void> addOrders(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse(
        'https://shopapp-backend-default-rtdb.asia-southeast1.firebasedatabase.app/orders.json');
    final timestamp = DateTime.now();
    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price,
                })
            .toList(),
      }),
    );
    final rspData = json.decode(response.body);
    _orders.insert(
        0,
        OrderItem(
            id: rspData['name'],
            amount: total,
            products: cartProducts,
            dateTime: timestamp));
    notifyListeners();
  }
}
