class Book {
  final String? id;
  final String title;
  final String type;
  final String description;
  final double price;
  final String imageUrl;
  final bool isFavorite;

  Book({
    this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

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
}
