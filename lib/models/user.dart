class User {
  final String? id;
  final String name;
  final String sex;
  final String birthday;
  final String address;
  
  User({
    required this.id,
    required this.name,
    required this.sex,
    required this.birthday,
    required this.address,
  });

  User copyWith({
    String? id,
    String? name,
    String? sex,
    String? birthday,
    String? address,
    String,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      sex: sex ?? this.sex,
      birthday: birthday ?? this.birthday,
      address: address ?? this.address,
    );
  }
  
  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'sex': sex,
  //     'birthday': birthday,
  //     'address': address,
  
  //   };
  // }

  // static User fromJson(Map<String, dynamic> json) {
  //   return User(
  //     id: json['id'],
  //     name: json['name'],
  //     sex: json['sex'],
  //     birthday: json['birthday'],
  //     address: json['address'],
  //   );
  // }
}