import 'package:flutter/material.dart';

import '../../models/book.dart';

class BookDetailScreen extends StatelessWidget {
  static const routeName = '/book-detail';
  const BookDetailScreen(
    this.book, {
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                book.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Tên: ${book.title}',
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              'Thê loại: ${book.type}',
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              'Nội dung: ${book.description}',
              softWrap: true,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              'Giá bán: ${book.price} đ',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF0D47A1),
                                  Color(0xFF0D47A1),
                                ],
                              ),
                            ),
                          ),
                        ),
                        buildAddCartButton(context),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color.fromRGBO(13, 161, 80, 1),
                                  Color.fromRGBO(13, 161, 80, 1),
                                  Color.fromRGBO(13, 161, 80, 1),
                                ],
                              ),
                            ),
                          ),
                        ),
                        buildBuyNow(context),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAddCartButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TextButton(
        onPressed: () {
          print('Added book to shopping cart');
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        child: const Text('Thêm vào giỏ hàng'),
      ),
    );
  }

  Widget buildBuyNow(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TextButton(
        onPressed: () {
          print('Go to page Thanh toán');
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        child: const Text('Mua ngay'),
      ),
    );
  }
}
