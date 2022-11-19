import 'package:flutter/foundation.dart';

import '../../models/cart_book.dart';
import '../../models/order_book.dart';
class OrdersManager with ChangeNotifier {
  List<OrderBook> _orders = [
    OrderBook(
      id: 'p1',
      amount: 4200000,
      books: [
        CartBook(id: 'b1', title: 'One Piece', quality: 2, price: 2100000, imageUrl: 'https://i.truyenvua.xyz/ebook/190x247/dao-hai-tac_1552224567.jpg?gf=hdfgdfg&mobile=2'),
      ],
      dateTime: DateTime.now(),
    )
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