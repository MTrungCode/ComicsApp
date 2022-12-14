import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/book.dart';
import 'ui/books/book_manager.dart';
import 'ui/books/book_detail_screen.dart';

class SearchBox extends SearchDelegate {
  static const routeName = '/search-box';

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
  Widget buildResults(BuildContext context) => const Text('');

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Book> books = context.read<BookManager>().books;
    List<Book> suggestions = books.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();

      return bookTitle.contains(input);
    }).toList();
    return query.isEmpty
        ? const Text(
            'No result ...',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                final bookSuggest = suggestions[index];
                return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Image.network(
                      bookSuggest.imageUrl,
                      fit: BoxFit.cover,
                      width: 70,
                      height: 200,
                      cacheHeight: 300,
                    ),
                  ),
                  title: Text(bookSuggest.title),
                  onTap: () {
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
