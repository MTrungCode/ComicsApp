import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/book.dart';
import '../books/book_manager.dart';

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
            if (value == 2) {
              context.read<BookManager>().favoriteStatus(favoriteBook);
            } else if (value == 3) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(const SnackBar(
                  content: Text(
                    'Đã chia sẻ',
                  ),
                  duration: Duration(seconds: 2),
                  backgroundColor: Color.fromARGB(255, 49, 172, 19),
                ));
            }
          },
        ),
      ),
    );
  }
}
