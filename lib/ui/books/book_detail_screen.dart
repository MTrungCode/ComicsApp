import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/book.dart';
import '../../screen.dart';

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
        actions: <Widget>[
          buildFavoriteButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            SizedBox(
                height: 300,
                width: 200,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 5,
                      color: const Color.fromARGB(255, 194, 197, 194),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Image.network(
                    book.imageUrl,
                    fit: BoxFit.contain,
                  ),
                )),
            const SizedBox(height: 10),
            Text(
              'Tên: ${book.title}',
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              'Thê loại: ${book.type}',
              style: const TextStyle(fontSize: 14),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Nội dung: ${book.description}',
                softWrap: true,
                style: const TextStyle(fontSize: 14),
              ),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  Color.fromARGB(255, 18, 188, 95),
                                  Color.fromARGB(255, 22, 151, 80),
                                  Color.fromARGB(255, 51, 174, 106),
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
          final cart = context.read<CartManager>();
          cart.addBook(book);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: const Text(
                'Đã thêm vào giỏ hàng',
              ),
              duration: const Duration(seconds: 3),
              action: SnackBarAction(
                label: 'Hoàn tác',
                textColor: const Color.fromARGB(255, 235, 235, 235),
                onPressed: () {
                  cart.removeSingleItem(book.id!);
                },
              ),
              backgroundColor: const Color.fromARGB(255, 30, 144, 45),
            ));
        },
        child: const Text(
          "Thêm vào giỏ hàng",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildBuyNow(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        child: const Text('Đến giỏ hàng'),
      ),
    );
  }

  Widget buildFavoriteButton() {
    return ValueListenableBuilder<bool>(
      valueListenable: book.isFavoriteListenable,
      builder: (context, isFavorite, child) {
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
          ),
          color: Colors.red,
          onPressed: () {
            context.read<BookManager>().favoriteStatus(book);
          },
        );
      },
    );
  }
}
