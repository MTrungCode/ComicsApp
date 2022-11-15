import 'package:flutter/material.dart';

import 'cart_manager.dart';
import 'cart_book_cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
      ),
      body: Column(
        children: [
          buildCartSummary(cart, context),
          const SizedBox(height: 10),
          Expanded(
            child: buildCartDetails(cart),
          )
        ],
      ),
    );
  }

  Widget buildCartDetails(CartManager cart) {
    return ListView(
      children: cart.bookEntries
          .map(
            (entry) => CartBookCart(
              bookId: entry.key,
              cardBook: entry.value,
            ),
          )
          .toList(),
    );
  }

  Widget buildCartSummary(CartManager cart, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(fontSize: 20),
            ),
            const Spacer(),
            Chip(
              label: Text(
                '\$${cart.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.headline6?.color,
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            TextButton(
              onPressed: () {
                print('Một đơn hàng đã được thêm vào');
              },
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: Theme.of(context).primaryColor),
              ),
              child: const Text('Đặt hàng ngay'),
            )
          ],
        ),
      ),
    );
  }
}
