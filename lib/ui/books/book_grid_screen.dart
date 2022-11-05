import 'package:flutter/material.dart';

import 'book_grid_tile.dart';
import 'book_manager.dart';

class BookGridScreen extends StatefulWidget {
  const BookGridScreen({super.key});

  @override
  State<BookGridScreen> createState() => _BookGridScreenState();
}

class _BookGridScreenState extends State<BookGridScreen> {
  @override
  Widget build(BuildContext context) {
    final booksManager = BookManager();
    final books = booksManager.books;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: booksManager.itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) => BookGridTile(books[index]),
    );
  }
}
