import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import '../shared/app_drawer.dart';

import 'order_book_card.dart';
import 'order_manager.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('building orders');
    final ordersManager = OrdersManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn hàng của bạn'),
      ),

      body: ListView.builder(
            itemCount: ordersManager.orderCount,
            itemBuilder: (ctx, i) => OrderBookCart(ordersManager.orders[i]),
          ),
    ); 
  }
}