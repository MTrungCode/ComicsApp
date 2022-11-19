import 'package:flutter/material.dart';
import '../../models/book.dart';

class UserBookListTile extends StatelessWidget {
  final Book book;
  const UserBookListTile(
    this.book, {
    super.key,
  });

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
          children: [
            buildUserButton(context),
            buildDeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildUserButton(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.edit),
      color: Theme.of(context).primaryColor,
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: const Icon(Icons.delete),
        color: Theme.of(context).errorColor);
  }
}
