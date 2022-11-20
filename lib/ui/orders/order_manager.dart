import 'package:flutter/foundation.dart';

import '../../models/cart_book.dart';
import '../../models/order_book.dart';
class OrdersManager with ChangeNotifier {
  List<OrderBook> _orders = [
  ];

  int get orderCount {
    return _orders.length;
  }

  List<OrderBook> get orders {
    return [..._orders];
  }

  void addOrder(List<CartBook> cartBooks, double total) async {
    _orders.insert(
      0,
      OrderBook(
        id: 'o${DateTime.now().toIso8601String()}',
        amount: total,
        books: cartBooks,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
  void orderClear() {
    _orders = [];
    notifyListeners();
  }
}