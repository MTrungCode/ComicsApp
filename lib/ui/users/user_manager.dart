import '../../models/user.dart';

import 'package:flutter/foundation.dart';

class UserManager with ChangeNotifier {
  final List<User> _users = [
    User(
      id: 'u1',
      name: 'Tonny Nguyễn',
      sex: 'nam',
      birthday: "1/1/2001",
      address: "Cần Thơ",
    ),
  ];
  void addNewInfo(User user) {
    _users.add(
      user.copyWith(
        id: 'p${DateTime.now().toIso8601String()}',
      ),
    );
    notifyListeners();
  }

  void updateInfo(User user) {
    final index = _users.indexWhere((element) => element.id == user.id);
    if (index >= 0) {
      _users[index] = user;
      notifyListeners();
    }
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
