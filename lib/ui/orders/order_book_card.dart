import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/order_book.dart';
import 'order_manager.dart';
import 'package:provider/provider.dart';

class OrderBookCart extends StatefulWidget {
  final OrderBook order;

  const OrderBookCart(this.order, {super.key});

  @override
  State<OrderBookCart> createState() => _OrderBookCardState();
}

class _OrderBookCardState extends State<OrderBookCart> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    final order = context.watch<OrdersManager>();
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildOrderSummary(order, context),
          if (_expanded) buildOrderDetails()
        ],
      ),
    );
  }

  Widget buildOrderDetails() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      height: min(widget.order.bookCount * 40.0 + 10, 100),
      child: ListView(
        children: widget.order.books
            .map((prod) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(prod.imageUrl),
                        ),
                        Text(
                          '    ${prod.title}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 21, 5, 4),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      ' Số lượng: ${prod.quality} \n Giá tiền: \$${prod.price}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }

  Widget buildOrderSummary(OrdersManager orders, BuildContext context) {
    return ListTile(
      title: Text(
        'Tổng tiền: \$${widget.order.amount}',
        style: const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 82, 33, 243),
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle:
          Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
      leading: IconButton(
        icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
        onPressed: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
      ),
      trailing: OutlinedButton(
          onPressed: () {
            orders.orderClear();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                    content: Text('Đã hủy đơn hàng này',
                        textAlign: TextAlign.center),
                    backgroundColor: Color.fromARGB(255, 42, 200, 34),
                    duration: Duration(seconds: 1)),
              );
          },
          child: const Text('Hủy đơn')),
    );
  }
}
