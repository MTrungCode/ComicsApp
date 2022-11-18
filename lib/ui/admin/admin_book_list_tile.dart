import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/book.dart';
import 'admin_edit_book_screen.dart';
import '../books/book_manager.dart';

class AdminBookListTile extends StatelessWidget {
  final Book book;
  const AdminBookListTile(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(book.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            buildEditButton(context),
            buildDeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          AdminEditBookScreen.routeName,
          arguments: book.id,
        );
      },
      icon: const Icon(Icons.edit_attributes),
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
              content: Text(
                'You deleted a book',
                textAlign: TextAlign.center,
              ),
            ),
          );
      },
      icon: const Icon(Icons.delete_forever),
    );
  }
}
