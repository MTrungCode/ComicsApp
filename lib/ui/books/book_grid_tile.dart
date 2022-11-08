import 'package:flutter/material.dart';

import '../../models/book.dart';
import 'book_detail_screen.dart';

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
      backgroundColor: Colors.blueGrey,
      trailing: ValueListenableBuilder<bool>(
        valueListenable: book.isFavoriteListenable,
        builder: (context, isFavorite, child) {
          return IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              book.isFavorite = !isFavorite;
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
          print('Added to shopping cart');
        },
        icon: const Icon(Icons.add_shopping_cart),
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
