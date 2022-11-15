import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../books/book_manager.dart';
import 'favorite_list_tile.dart';
import '../../search_box.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({super.key});
  
  Future<void> _refreshBooks(BuildContext context) async {
    await context.read<BookManager>().favoriteBook;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Truyện yêu thích'),
        actions: <Widget>[
          buildAddButton(context),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshBooks(context),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: buildFavoriteListView(),
        ),
      ),
    );
  }

  Widget buildFavoriteListView() {
    return Consumer<BookManager>(
      builder: (context, booksManager, child) {
        return ListView.builder(
          itemCount: booksManager.favoriteBook.length,
          itemBuilder: (ctx, i) => Column(
            children: [
              FavoriteListTile(
                booksManager.favoriteBook[i],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        showSearch(
          context: context,
          delegate: SearchBox(),
        );
      },
    );
  }
}
