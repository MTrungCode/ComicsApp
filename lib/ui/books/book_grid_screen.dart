import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/book.dart';
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
    final books = context.select<BookManager, List<Book>>(
      (booksManager) => booksManager.books,
    );
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: books.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => BookGridTile(books[index]),
    );
  }
}
