import 'package:flutter/foundation.dart';

import '../../models/cart_book.dart';
import '../../models/book.dart';

class CartManager with ChangeNotifier {
  Map<String, CartBook> _items = {
    // 'p1': CartBook(
    //   id: 'b1',
    //   title: 'One Piece',
    //   quality: 2,
    //   price: 2100000,
    //   imageUrl:
    //       'https://st.ntcdntempv3.com/data/comics/209/dao-hai-tac.jpg',
    // ),
    // 'p2': CartBook(
    //   id: 'b2',
    //   title: 'Naruto',
    //   quality: 1,
    //   price: 1440000,
    //   imageUrl:
    //       'https://st.ntcdntempv3.com/data/comics/220/naruto-cuu-vi-ho-ly.jpg',
    // ),
  };

  void addBook(Book book) {
    if (_items.containsKey(book.id)) {
      _items.update(
        book.id!,
        (existingCartItem) => existingCartItem.copyWith(
          quality: existingCartItem.quality + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        book.id!,
        () => CartBook(
          id: 'c${DateTime.now().toIso8601String()}',
          title: book.title,
          price: book.price,
          quality: 1,
          imageUrl:  book.imageUrl,
        ),
      );
    }
    notifyListeners();
  }
  void removeItem(String bookId) {
    _items.remove(bookId);
    notifyListeners();
  }
  void removeSingleItem(String bookId) {
    if (!_items.containsKey(bookId)) {
      return;
    }
    if (_items[bookId]?.quality as num > 1) {
      _items.update(
        bookId,
        (existingCartItem) => existingCartItem.copyWith(
          quality: existingCartItem.quality - 1,
        ),
      );
    } else {
      _items.remove(bookId);
    } 
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
  int get bookCount {
    return _items.length;
  }

  List<CartBook> get books {
    return _items.values.toList();
  }

  Iterable<MapEntry<String, CartBook>> get bookEntries {
    return {..._items}.entries;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quality;
    });
    return total;
  }
}