import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../books/book_manager.dart';
import 'favorite_list_tile.dart';
import '../../models/book.dart';

class FavoriteListView extends StatelessWidget {
  final bool showFavorites;

  const FavoriteListView(this.showFavorites, {super.key});

  @override
  Widget build(BuildContext context) {
    final List<Book> listfavor = [];
    final favoriteBooks = context.select<BookManager, List<Book>>(
        (bookManager) => showFavorites ? bookManager.favoriteBook : listfavor);
    return ListView.builder(
      itemCount: favoriteBooks.length,
      itemBuilder: (ctx, i) => Column(
        children: [
          FavoriteListTile(
            favoriteBooks[i],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
