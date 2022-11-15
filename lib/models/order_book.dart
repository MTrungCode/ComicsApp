import 'CartBook.dart';

class OrderBook {
  final String? id;
  final double? amount;
  final List<CartBook> books;
  final DateTime dateTime;

  int get bookCount {
    return books.length;
  }
  OrderBook({
    this.id,
    required this.amount,
    required this.books,
    DateTime?  dateTime,
  }) : dateTime = dateTime ?? DateTime.now();

  OrderBook copyWith({
    String? id,
    double? amount,
    List<CartBook>? books,
    DateTime? dateTime,
  }) {
    return OrderBook(
      id:  id ?? this.id,
      amount: amount ?? this.amount,
      books: books ?? this.books,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}