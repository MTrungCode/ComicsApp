import 'package:flutter/material.dart';

import '../books/book_grid_tile.dart';
import '../books/book_manager.dart';

class FavoriteGridScreen extends StatefulWidget {
  const FavoriteGridScreen({super.key});

  @override
  State<FavoriteGridScreen> createState() => _FavoriteGridScreenState();
}

class _FavoriteGridScreenState extends State<FavoriteGridScreen> {
  @override
  Widget build(BuildContext context) {
    final booksManager = BookManager();
    final books = booksManager.favoriteBook;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sản phẩm yêu thích'),
        actions: <Widget>[
          buildRefreshButton(context),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: books.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) => BookGridTile(books[index]),
      ),
    );
  }

  Widget buildRefreshButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        print('Page would refresh');
      },
      icon: const Icon(Icons.refresh),
    );
  }
}
