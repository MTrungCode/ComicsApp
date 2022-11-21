
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/book.dart';
import '../../screen.dart';
import '../../seach_edit_book.dart';

class SearchEditScreen extends StatelessWidget {
  static const routeName = '/book-manager-screen';
  const SearchEditScreen(
    this.book, {
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
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
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: RefreshIndicator(
          onRefresh: () async => print('Làm mới'),
          child: searchManagerEditBook(context),
        ),
      ),
    );
  }

  Widget searchManagerEditBook(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 230,
      child: Card(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 180,
              height: 170,
              child: Image.network(book.imageUrl),
            ),
            Container(
              margin: const EdgeInsets.only(left: 35, right: 0),
              // decoration: BoxDecoration(
              //   color: Colors.red
              // ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildUserButton(context),
                  Text(book.title),
                  buildDeleteButton(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildUserButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditBookScreen.routeName,
          arguments: book.id,
        );
      },
      icon: const Icon(Icons.edit),
      tooltip: "Chỉnh sửa",
      color: Theme.of(context).primaryColor,
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<BookManager>().deleteBook(book.id!);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Xoá sản phẩm thành công',
                    textAlign: TextAlign.center),
                backgroundColor: Color.fromARGB(255, 42, 200, 34),
                duration: Duration(seconds: 1),
              ),
            );
        },
        icon: const Icon(Icons.delete),
        tooltip: "Xóa",
        color: Theme.of(context).errorColor);
  }
}
