import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../books/book_detail_screen.dart';
import '../books/book_manager.dart';
import 'favorite_list_view.dart';
import '../../models/book.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Truyện yêu thích'),
        actions: [
          buildAddFavoriteButton(context),
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

  Widget buildAddFavoriteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        showSearch(
          context: context,
          delegate: AddBox(),
        );
      },
    );
  }
}

class AddBox extends SearchDelegate {
  List<Book> books = BookManager().books;

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        ),
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: SizedBox(
          height: 10,
          child: Text(
            query,
            style: const TextStyle(
              fontSize: 64,
            ),
          ),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Book> suggestions = books.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();

      return bookTitle.contains(input);
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final bookSuggest = suggestions[index];
          return ListTile(
            leading: Image.network(
              bookSuggest.imageUrl,
              fit: BoxFit.cover,
              width: 70,
              height: 200,
              cacheHeight: 300,
            ),
            title: Text(bookSuggest.title),
            onTap: () {
              // Navigator.of(context).pushNamed(
              //   BookDetailScreen.routeName,
              //   arguments: bookSuggest.id,
              // );
              Navigator.of(context).pushReplacementNamed(
                BookDetailScreen.routeName,
                arguments: bookSuggest.id,
              );
            },
          );
        },
      ),
    );
  }
}
