
import '../../models/CartBook.dart';

class CartManager {
  final Map<String, CartBook> _iteams = {
    'p1': CartBook(
      id: 'b1',
      title: 'One Piece',
      quality: 2,
      price: 2100000,
      imageUrl:
          'https://i.truyenvua.xyz/ebook/190x247/dao-hai-tac_1552224567.jpg?gf=hdfgdfg&mobile=2',
    ),
  };

  int get bookCount {
    return _iteams.length;
  }

  List<CartBook> get books {
    return _iteams.values.toList(); 
  }

  Iterable<MapEntry<String, CartBook>> get bookEntries {
    return  {..._iteams}.entries;
  }
  double get totalAmount {
    var total = 0.0;
    _iteams.forEach((key, value) {
      total += value.price * value.quality;
    });
    return total;
  }
}