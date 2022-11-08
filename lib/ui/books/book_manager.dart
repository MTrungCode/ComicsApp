import '../../models/book.dart';

class BookManager {
  final List<Book> _items = [
    Book(
      id: 'b1',
      title: 'One Piece',
      type: 'Tiểu thuyết phiêu lưu, Kỳ ảo',
      description:
          'One Piece là câu truyện kể về Luffy và các thuyền viên của mình. Khi còn nhỏ, Luffy ước mơ trở thành Vua Hải Tặc. Cuộc sống của cậu bé thay đổi khi cậu vô tình có được sức mạnh có thể co dãn như cao su, nhưng đổi lại, cậu không bao giờ có thể bơi được nữa. Giờ đây, Luffy cùng những người bạn hải tặc của mình ra khơi tìm kiếm kho báu One Piece, kho báu vĩ đại nhất trên thế giới. Trong One Piece, mỗi nhân vật trong đều mang một nét cá tính đặc sắc kết hợp cùng các tình huống kịch tính, lối dẫn truyện hấp dẫn chứa đầy các bước ngoặt bất ngờ và cũng vô cùng hài hước đã biến One Piece trở thành một trong những bộ truyện nổi tiếng nhất không thể bỏ qua. Hãy đọc One Piece để hòa mình vào một thế giới của những hải tặc rộng lớn, đầy màu sắc, sống động và thú vị, cùng đắm chìm với những nhân vật yêu tự do, trên hành trình đi tìm ước mơ của mình.',
      price: 2100000,
      imageUrl: 'https://st.ntcdntempv3.com/data/comics/209/dao-hai-tac.jpg',
      isFavorite: true,
    ),
    Book(
      id: 'b2',
      title: 'Naruto',
      type: 'Tiểu thuyết phiêu lưu, Kỳ ảo hài hước, Võ thuật',
      description:
          'Bối cảnh Naruto xảy ra vào mười hai năm trước khi câu chuyện chính thức bắt đầu, một con hồ ly chín đuôi đã tấn công Konohagakure. Nó là một con quái vật có sức mạnh khủng khiếp, chỉ một cái vẫy từ một trong chín cái đuôi của nó có thể tạo ra những cơn sóng thần và san bằng nhiều ngọn núi. Nó gây ra sự hỗn loạn và giết chết rất nhiều người cho đến khi người đứng đầu làng Lá – Hokage đệ tứ – đã đánh bại nó bằng cách đổi lấy mạng sống của mình để phong ấn nó vào trong người một đứa trẻ mới sinh. Đứa trẻ đó tên là Uzumaki Naruto. Bộ truyện kể về cuộc hành trình đầy gian khổ với vô vàn khó khăn, thử thách của Naruto từ khi còn là một cậu bé tới khi trở thành một trong những nhẫn giả vĩ đại nhất. Không chỉ mô tả về một thế giới nhẫn giả huyền bí, Naruto còn mang trong nó nhiều ý nghĩa nhân sinh sâu sắc về tình bạn, tình đồng đội, tình yêu, ước mơ và hi vọng.',
      price: 1440000,
      imageUrl:
          'https://st.ntcdntempv3.com/data/comics/220/naruto-cuu-vi-ho-ly.jpg',
    ),
    Book(
      id: 'b3',
      title: 'Black Clover',
      type: 'Action - Fantasy - Manga - Shounen',
      description:
          'Asta và Yuno là hai đứa trẻ bị bỏ rơi ở nhà thờ và cùng nhau lớn lên tại đó. Khi còn nhỏ, chúng đã hứa với nhau xem ai sẽ trở thành Ma pháp vương tiếp theo. Thế nhưng, khi cả hai lớn lên, mọi xô chuyện đã thay đổi. Yuno là thiên tài ma pháp với sức mạnh tuyệt đỉnh trong khi Aster lại không thể sử dụng ma pháp và cố gắng bù đắp bằng thể lực. Khi cả hai được nhận sách phép vào tuổi 15, Yuno đã được ban cuốn sách phép cỏ bốn bá (trong khi đa số là cỏ ba lá) mà Aster lại không có cuốn nào. Tuy nhiên, khi Yuno bị đe dọa, sự thật về sức mạnh của Aster đã được giải mã- cậu ta được ban cuốn sách phép cỏ năm lá, cuốn sách phá ma thuật màu đen. Bấy giờ, hai người bạn trẻ đang hướng ra thế giới, cùng chung mục tiêu.',
      price: 1000000,
      imageUrl:
          'https://st.ntcdntempv3.com/data/comics/69/black-clover-phap-su-khong-phep-thuat.jpg',
      isFavorite: true,
    ),
    Book(
      id: 'b4',
      title: 'Attack on Titan',
      type: 'Kịch, Shounen manga',
      description:
          'Hơn 100 năm trước, giống người khổng lồ Titan đã tấn công và đẩy loài người tới bờ vực tuyệt chủng. Những con người sống sót tụ tập lại, xây bao quanh mình 1 tòa thành 3 lớp kiên cố và tự nhốt mình bên trong để trốn tránh những cuộc tấn công của người khổng lồ. Họ tìm mọi cách để tiêu diệt người khổng lồ nhưng không thành công. Và sau 1 thế kỉ hòa bình, giống khổng lồ đã xuất hiện trở lại, một lần nữa đe dọa sự tồn vong của con người....  Elen và Mikasa phải chứng kiến một cảnh tượng cực kinh khủng - mẹ của mình bị ăn thịt ngay trước mắt. Elen thề rằng cậu sẽ giết tất cả những tên khổng lồ mà cậu gặp.....',
      price: 1523500,
      imageUrl:
          'https://st.ntcdntempv3.com/data/comics/211/dai-chien-nguoi-khong-lo.jpg',
    ),
    Book(
      id: 'b5',
      title: 'Detective Conan',
      type:
          'Comedy - Drama - Manga - Mystery - Romance - School Life - Trinh Thám',
      description:
          'Mở đầu câu truyện, cậu học sinh trung học 16 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường. Trong một lần đi chơi công viên "Miền Nhiệt đới" với cô bạn từ thuở nhỏ (cũng là bạn gái) Ran Mori , cậu bị dính vào vụ án một hành khách trên Chuyến tàu tốc hành trong công viên, Kishida , bị giết trong một vụ án cắt đầu rùng rợn. Cậu đã làm sáng tỏ vụ án và trên đường về nhà, chứng kiến một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Kudo bị phát hiện, bị đánh ngất sau đó những người đàn ông áo đen đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 (APTX4869) với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy thân thể mình đã bị teo nhỏ trong hình dạng của một cậu học sinh tiểu học....',
      price: 1824000,
      imageUrl: 'https://st.ntcdntempv3.com/data/comics/30/tham-tu-conan.jpg',
    ),
    Book(
      id: 'b6',
      title: 'Dragon Ball',
      type: 'Tiểu thuyết phiêu lưu, Kỳ ảo hài hước, Võ thuật',
      description:
          'Câu truyện kể về một cậu bé tên Songoku cùng nhóm bạn của mình tham gia những chuyến phiêu lưu tìm ngọc rồng, chống lại cái ác bảo vệ trái đất. Nhân vật Songoku được mọi người ưa thích bởi tính thánh thiện và ngây ngô của mình. Câu truyện lôi cuốn người qua những tình huống phiêu lưu kì thú, những pha đấu võ đẹp mắt, và những tình huống hài hước.',
      price: 1050000,
      imageUrl:
          'https://st.ntcdntempv3.com/data/comics/229/dragon-ball-bay-vien-ngoc-rong.jpg',
      isFavorite: true,
    ),
  ];

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
}
