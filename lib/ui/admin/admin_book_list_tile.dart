
import '../../screen.dart';
import 'package:flutter/material.dart';
import '../../models/book.dart';
import 'package:provider/provider.dart';

class UserBookListTile extends StatelessWidget {
  final Book book;
  const UserBookListTile(
    this.book, {
    super.key,
  });

  @override
   Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 230,
      child: Card(
        child: Column(
         children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 180,
            height: 170,
            child: Image.network(book.imageUrl),
          ),
          Container(
            margin: EdgeInsets.only(left: 35, right: 0),
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
         ] ,
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