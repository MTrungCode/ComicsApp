import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'book_grid_screen.dart';
import 'book_manager.dart';

class BookOverviewScreen extends StatefulWidget {
  const BookOverviewScreen({super.key});

  @override
  State<BookOverviewScreen> createState() => _BookOverviewScreenState();
}

class _BookOverviewScreenState extends State<BookOverviewScreen> {
  late Future<void> _fetchBooks;

  @override
  void initState() {
    super.initState();
    _fetchBooks = context.read<BookManager>().fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchBooks,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RefreshIndicator(
            onRefresh: () => _fetchBooks,
            child: const BookGridScreen(),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
