class User {
  final String id;
  final String name;
  final String sex;
  final String birthday;
  final String address;
  final String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.sex,
    required this.birthday,
    required this.address,
    required this.imageUrl,
  });

  User copyWith({
    String? id,
    String? name,
    String? sex,
    String? birthday,
    String? address,
    String? imageUrl,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      sex: sex ?? this.sex,
      birthday: birthday ?? this.birthday,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}