import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'admin_book_list_tile.dart';
import '../books/book_manager.dart';
import '../shared/app_drawer.dart';
import 'admin_edit_book_screen.dart';

class AdminBookScreen extends StatelessWidget {
  static const routeName = "/admin";
  const AdminBookScreen({super.key});

  Future<void> _refreshBooks(BuildContext context) async {
    await context.read<BookManager>().fetchBooks(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý truyện'),
        actions: <Widget>[
          buildAddBookButton(context),
        ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _refreshBooks(context),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () => _refreshBooks(context),
            child: buildAdminBooktListView(),
          );
        },
      ),
    );
  }

  Widget buildAddBookButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          AdminEditBookScreen.routeName,
        );
      },
      icon: const Icon(Icons.add),
    );
  }

  Widget buildAdminBooktListView() {
    return Consumer<BookManager>(
      builder: (context, bookManager, child) {
        return ListView.builder(
          itemCount: bookManager.itemCount,
          itemBuilder: (context, index) => Column(
            children: [
              AdminBookListTile(
                bookManager.books[index],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
