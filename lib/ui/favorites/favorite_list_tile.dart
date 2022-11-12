import 'package:flutter/material.dart';
import '../../models/book.dart';

class FavoriteListTile extends StatelessWidget {
  final Book favoriteBook;
  const FavoriteListTile(
    this.favoriteBook, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(favoriteBook.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(favoriteBook.imageUrl),
      ),
      trailing: SingleChildScrollView(
        child: PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (context) => <PopupMenuItem<int>>[
            const PopupMenuItem<int>(
              value: 2,
              textStyle: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              child: Text('Xóa'),
            ),
            const PopupMenuItem<int>(
              value: 3,
              textStyle: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              child: Text('Chia sẻ'),
            ),
          ],
          onSelected: (value) {
            print(value);
          },
        ),
      ),
    );
  }
}
