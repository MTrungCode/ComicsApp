import '../../models/book.dart';

class BookManager {
  final List<Book> _items = [];

  int get itemCount {
    return _items.length;
  }

  List<Book> get books {
    return [..._items];
  }

  List<Book> get favoriteBook {
    return _items.where((bookItem) => bookItem.isFavorite).toList();
  }
}
