import 'package:flutter/material.dart';
import 'user_manager.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);
  static const routeName = '/users';
  @override
  Widget build(BuildContext context) {
    final user = UserManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin cá nhân'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 115,
            width: 115,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("/images/1.jpg"),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}


