import 'package:flutter/material.dart';
import '../../models/book.dart';

class EditBookListTile extends StatelessWidget {
  final Book book;
  const EditBookListTile(
    this.book, {
      super.key,
    }
  );

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
            buildEditButton(context),
            buildDeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.edit),
      color: Theme.of(context).primaryColor,
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.delete),
      color: Theme.of(context).errorColor
    );
  }

}