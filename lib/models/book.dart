import 'package:flutter/foundation.dart';

class Book {
  final String? id;
  final String title;
  final String type;
  final String description;
  final double price;
  final String imageUrl;
  final ValueNotifier<bool> _isFavorite;

  Book({
    this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.price,
    required this.imageUrl,
    isFavorite = false,
  }) : _isFavorite = ValueNotifier(isFavorite);

  set isFavorite(bool newValue) {
    _isFavorite.value = newValue;
  }

  bool get isFavorite {
    return _isFavorite.value;
  }

  ValueNotifier<bool> get isFavoriteListenable {
    return _isFavorite;
  }

  Book copyWith({
    String? id,
    String? title,
    String? type,
    String? description,
    double? price,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'type': type,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  static Book fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}
