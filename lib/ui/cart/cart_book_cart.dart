// import 'package:comicsapp/ui/cart/CartManager.dart';
import 'package:flutter/material.dart';

import '../../models/cart_book.dart';
import '../shared/dialog_utils.dart';

class CartBookCart extends StatelessWidget {
  final String bookId;
  final CartBook cardBook;

  const CartBookCart({
    required this.bookId,
    required this.cardBook,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cardBook.id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showConfirmDialog(
            context, 'Bạn có muốn xóa sản phẩm này ra khỏi giỏ?');
      },
      onDismissed: (direction) {
        print('Cart book dismissed');
      },
      child: buildBookCart(),
    );
  }

  Widget buildBookCart() {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              //child: Image.network('https://i.truyenvua.xyz/ebook/190x247/dao-hai-tac_1552224567.jpg?gf=hdfgdfg&mobile=2'),
              child: FittedBox(
                child: Text('\$${cardBook.price}'),
              ),
            ),
          ),
          title: Text(cardBook.title),
          subtitle: Text('Total: \$${(cardBook.price * cardBook.quality)}'),
          trailing: Text('${cardBook.quality} x'),
        ),
      ),
    );
  }
}
