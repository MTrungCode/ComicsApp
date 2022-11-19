

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'user_book_list_tile.dart';
import '../books/book_manager.dart';
import '../shared/app_drawer.dart';
import 'package:comicsapp/screen.dart';
import 'package:comicsapp/seach_edit_book.dart';
//import 'edit_book_screen.dart';
import 'admin_book_list_tile.dart';
import 'admin_edit_book_screen.dart';

class userBookScreen extends StatefulWidget {
  const userBookScreen({super.key});
  static const routeName = '/user-book';

  @override
  State<userBookScreen> createState() => _userBookScreenState();
}

class _userBookScreenState extends State<userBookScreen> {
  Future<void> _refreshBooks(BuildContext context) async {
    await context.read<BookManager>().fetchBooks(true);
  }
  @override
  Widget build(BuildContext context) {
    final booksManager = BookManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý truyện'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchEditBook(),
            );
            },
            icon: const Icon(Icons.search),
          )
        ],  
      ),
      body: FutureBuilder(
        future: _refreshBooks(context),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: RefreshIndicator(
                onRefresh: () async => print('Làm mới'),
                child: builduserBookListView(booksManager),
              ),
            );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).pushNamed(
            EditBookScreen.routeName,);
        },
        backgroundColor: Color.fromARGB(255, 30, 173, 39),
        tooltip: "Thêm sách",
        child: const Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  // Widget builduserBookListView(BookManager booksManager) {
  Widget builduserBookListView(BookManager booksManager) {
    return Consumer<BookManager> (
      builder: (ctx, booksManager, child) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: booksManager.itemCount,
          itemBuilder: (context, index) => Column(
            children: [
              UserBookListTile(
                booksManager.books[index],
              ),
              //const Divider(),
            ],
          ),
        );
      }
    );
  }
}
