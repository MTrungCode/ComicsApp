import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart/cart_manager.dart';
import '../../models/book.dart';
import 'book_detail_screen.dart';
import 'book_manager.dart';

class BookGridTile extends StatelessWidget {
  const BookGridTile(this.book, {super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: buildFooterButton(context),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              BookDetailScreen.routeName,
              arguments: book.id,
            );
          },
          child: Image.network(
            book.imageUrl,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  Widget buildFooterButton(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.blue[300],
      trailing: ValueListenableBuilder<bool>(
        valueListenable: book.isFavoriteListenable,
        builder: (context, isFavorite, child) {
          return IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              context.read<BookManager>().favoriteStatus(book);
            },
          );
        },
      ),
      title: Text(
        book.title,
        textAlign: TextAlign.center,
      ),
      leading: IconButton(
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
                textColor: const Color.fromARGB(255, 255, 255, 255),
                onPressed: () {
                  cart.removeSingleItem(book.id!);
                },
              ),
              backgroundColor: const Color.fromARGB(255, 30, 144, 45),
            ));
        },
        icon: const Icon(Icons.add_shopping_cart),
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
