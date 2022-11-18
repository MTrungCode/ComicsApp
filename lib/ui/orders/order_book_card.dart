import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/order_book.dart';

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
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildOrderSummary(),
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
                    // Image.network('https://i.truyenvua.xyz/ebook/190x247/dao-hai-tac_1552224567.jpg?gf=hdfgdfg&mobile=2',
                    // width: 50,
                    // height: 30,),
                    Text(
                      prod.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
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

  Widget buildOrderSummary() {
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
      trailing: IconButton(
        icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
        onPressed: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
      ),
    );
  }
}
