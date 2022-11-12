import '../../models/user.dart';

class UserManager {
  final List<User> _users = [
    User(
      id: 'u1',
      name: 'Jon',
      sex: 'male',
      birthday: "1/1/2001",
      address: "Kan Thor",
      imageUrl:
          'https://toigingiuvedep.vn/wp-content/uploads/2021/05/hinh-anh-avatar-nam-dep-trai-lanh-lung.jpg',
    ),
    User(
      id: 'u2',
      name: 'Wendy',
      sex: 'female',
      birthday: "13/2/2001",
      address: "Kan Thor",
      imageUrl:
          'https://demoda.vn/wp-content/uploads/2022/03/anh-avatar-nu-mu-den.jpg',
    ),
  ];

  int get userCount {
    return _users.length;
  }

  List<User> get users {
    return [..._users];
  }

  List<User> get male {
    return _users.where((userItem) => userItem.sex == 'male').toList();
  }

  List<User> get female {
    return _users.where((userItem) => userItem.sex == 'female').toList();
  }

  User findById(String id) {
    return _users.firstWhere((user) => user.id == id);
  }
}
