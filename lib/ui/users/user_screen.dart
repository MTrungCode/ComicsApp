import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);
  static const routeName = '/users';
  @override
  Widget build(BuildContext context) {
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
              children: const [
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
