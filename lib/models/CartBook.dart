class CartBook {
  final String id;
  final String title;
  final int quality;
  final double price;
  final String imageUrl;

  CartBook({
    required this.id,
    required this.title,
    required this.quality,
    required this.price,
    required this.imageUrl,
  });

  CartBook copyWith({
    String? id,
    String? title,
    int? quality,
    double? price,
    String? imageUrl,
  }) {
    return CartBook(
      id: id ?? this.id,
      title: title ?? this.title,
      quality: quality ?? this.quality,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}