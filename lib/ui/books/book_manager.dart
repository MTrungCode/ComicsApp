import 'package:flutter/foundation.dart';

import '../../models/book.dart';
import '../../services/books_service.dart';
import '../../models/auth_token.dart';

class BookManager with ChangeNotifier {
  List<Book> _items = [];

  final BooksService _booksService;

  BookManager([AuthToken? authToken]) : _booksService = BooksService(authToken);

  set authToken(AuthToken? authToken) {
    _booksService.authToken = authToken;
  }

  Future<void> fetchBooks([bool filterByUser = false]) async {
    _items = await _booksService.fetchBooks(filterByUser);
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  List<Book> get books {
    return [..._items];
  }

  List<Book> get favoriteBook {
    return _items.where((bookItem) => bookItem.isFavorite).toList();
  }

  Book findById(String id) {
    return _items.firstWhere((bok) => bok.id == id);
  }

  Future<void> favoriteStatus(Book book) async {
    final saveStatus = book.isFavorite;
    book.isFavorite = !saveStatus;

    if (!await _booksService.saveFavoriteStatus(book)) {
      book.isFavorite = saveStatus;
    }
  }

  Future<void> addBook(Book book) async {
    final newBook = await _booksService.addBook(book);
    if (newBook != null) {
      _items.add(newBook);
      notifyListeners();
    }
  }

  Future<void> updateBook(Book book) async {
    final index = _items.indexWhere((item) => item.id == book.id);
    if (index >= 0) {
      if (await _booksService.updateBook(book)) {
        _items[index] = book;
        notifyListeners();
      }
    }
  }

  Future<void> deleteBook(String id) async {
    final index = _items.indexWhere((item) => item.id == id);
    Book? existingBook = _items[index];
    _items.removeAt(index);
    notifyListeners();

    if (!await _booksService.deleteBook(id)) {
      _items.insert(index, existingBook);
      notifyListeners();
    }
  }
}
