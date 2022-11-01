import 'package:flutter/material.dart';

import '../../models/book.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen(
    this.book, {
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
