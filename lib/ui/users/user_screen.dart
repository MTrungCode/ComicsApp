import 'package:comicsapp/ui/users/user_manager.dart';

import 'user_edit_info_screen.dart';
import 'package:flutter/material.dart';
import 'user_profile.dart';
class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);
 
  static const routeName = '/user-screen';
  @override
  Widget build(BuildContext context) {
    final user = UserManager().users[0];
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).pushNamed(
            UserEditInfoScreen.routeName,
          );
        //  print(UserEditInfoScreen.routeName);
        },
          child: const Icon(Icons.edit),
          backgroundColor: const Color.fromARGB(255, 229, 97, 74),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("/images/3.jpg"),
                fit: BoxFit.cover
              )
            ),
            
            child: const Center(
              child: UserProfile(),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: 300,
            height: 350,
              child: Column(
                children: [
               // Padding(padding: EdgeInsets.fromLTRB(0,10,0,20)),
                 Card(
                  margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child:Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 80,
                          child: Image.asset('/icons/user.png'),
                        ),
                         Text(user.name, style: TextStyle(fontSize: 18))
                      ],
                    ),  
                  ),
                Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child:Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 80,
                          child: Image.asset('/icons/sex.png'),
                        ),
                         Text(user.sex,style: TextStyle(fontSize: 18))
                      ],
                    ),  
                  ),
                Card(
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child:Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 80,
                          child: Image.asset('/icons/birthday-cake.png'),
                        ),
                         Text(user.birthday,
                        style: TextStyle(fontSize: 18)),
                      ],
                    ),  
                  ),
                Card(
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child:Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 80,
                          child: Image.asset('/icons/home.png'),
                        ),
                         Text(user.address,style: TextStyle(fontSize: 18)),
                      ],
                    ),  
                  ),
                ],
              ),
  
          )
        ],
      )
    );
    
  }
}



