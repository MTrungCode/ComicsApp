import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../books/book_manager.dart';
import 'favorite_list_view.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen({super.key});

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  final _showOnlyFavorites = ValueNotifier<bool>(false);
  late Future<void> _fetchBooks;

  @override
  void initState() {
    super.initState();
    _fetchBooks = context.read<BookManager>().fetchBooks();
  }

  // Future<void> _refresh() {

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Truyện yêu thích'),
        actions: [
          buildSharedButton(context),
        ],
      ),
      body: FutureBuilder(
        future: _fetchBooks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ValueListenableBuilder<bool>(
                valueListenable: _showOnlyFavorites,
                builder: (context, onlyFavorites, child) {
                  return FavoriteListView(onlyFavorites);
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildSharedButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.share),
      onPressed: () {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(const SnackBar(
            content: Text(
              'Đã chia sẻ',
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Color.fromARGB(255, 49, 172, 19),
          ));
      },
    );
  }
}
