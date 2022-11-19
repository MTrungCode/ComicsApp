import 'package:flutter/material.dart';
import '../orders/order_manager.dart';
import 'cart_manager.dart';
import 'cart_book_cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends  StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartManager>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
      ),
      body: Column(
        children: [
          
          Expanded(
            child: buildCartDetails(cart),
          ),
          buildCartSummary(cart, context),
          const SizedBox(height: 10),
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
      ).toList(),
    );
  }

  Widget buildCartSummary(CartManager cart, BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
      side:  BorderSide(color: Color.fromARGB(255, 100, 164, 164),width: 3),
      borderRadius: BorderRadius.all(Radius.circular(10))
  ),
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Chip(
              label: Text(
                'Tổng tiền: ' + '\$${cart.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.headline6?.color,
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            const Spacer(),
            TextButton(
              onPressed: cart.totalAmount <= 0 ? null : (){
                //  print('Một đơn hàng đã được thêm vào');
                context.read<OrdersManager>().addOrder(cart.books, cart.totalAmount);
                cart.clear();
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: Text('Đặt hàng thành công',
                      textAlign: TextAlign.center),
                      backgroundColor: Color.fromARGB(255, 42, 200, 34),
                      duration: Duration(seconds: 1)
                    ),
                  );
              },
              style: TextButton.styleFrom(
                 minimumSize: Size(40, 35),
                 backgroundColor: Color.fromARGB(255, 44, 122, 58),
                textStyle: TextStyle(color: Theme.of(context).primaryColor),
              ),
              child: const Text('Đặt hàng',
              style: TextStyle(
                color: Colors.white,
              ),),
            )
          ],
        ),
      ),
    ); 
  }
}
