import 'package:flutter/material.dart';
import 'user_book_list_tile.dart';
import 'book_manager.dart';

class userBookScreen extends StatelessWidget {
  const userBookScreen({super.key});
  static const routeName = '/user-book';
  @override
  Widget build(BuildContext context) {
    final booksManager = BookManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý sản phẩm'),
        // actions: <Widget>[
        //   buildAddButton(),
        //   //builduserButton(),
        // ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => print('Refresh'),
        child: builduserBookListView(booksManager),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.lightBlue,
        tooltip: "Thêm sách",
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget builduserBookListView(BookManager booksManager) {
    return ListView.builder(
      itemCount: booksManager.itemCount,
      itemBuilder: (context, index) => Column(
        children: [
          UserBookListTile(
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
