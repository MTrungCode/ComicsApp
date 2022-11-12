import 'package:comicsapp/ui/users/circle_image.dart';
import 'package:flutter/material.dart';
import 'user_manager.dart';
import 'userCard.dart';


class UserScreen extends StatelessWidget {
  
  const UserScreen({ Key? key}) : super(key: key);    

  @override
  Widget build(BuildContext context) {
    final user = UserManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin cá nhân'),
      ),
      body: Column(
        children: [
          buildInforUser(user, context),
          const SizedBox(height: 10),
        ],  
      ),
    );
  }
}

 Widget buildInforUser(UserManager User, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            child: UserCard(
            userName: 'Jony',
            position: 'Thành viên',
            //imageProvider: Image.network('src'),
          ),
          )
          ],
        
        ),
      ),

    );  
  }