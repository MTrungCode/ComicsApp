import 'package:flutter/material.dart';
import 'edit_book_list_tile.dart';
import 'book_manager.dart';

class EditBookScreen extends StatelessWidget {
  const EditBookScreen({super.key});
  static const routeName = '/edit-book';
  @override
  Widget build(BuildContext context) {
    final booksManager = BookManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý sản phẩm'),
        // actions: <Widget>[
        //   buildAddButton(),
        //   //buildEditButton(),
        // ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => print('Refresh'),
        child: buildEditBookListView(booksManager),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.lightBlue,
        tooltip: "Thêm sách",
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildEditBookListView(BookManager booksManager) {
    return ListView.builder(
      itemCount: booksManager.itemCount,
      itemBuilder: (context, index) => Column(
        children: [
          EditBookListTile(
            booksManager.books[index],
          ),
          const Divider(),
        ],
      ),
    );
  }
  // Widget buildAddButton() {
  //   return IconButton(
  //     onPressed: () {},
  //     icon: Icon(Icons.add),
  //     color: Colors.purple,
  //     tooltip: "Thêm sách",
  //     padding: EdgeInsets.all(10),
  //   );
  // }

}
