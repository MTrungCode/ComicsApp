import 'package:flutter/material.dart';
class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("/images/5.jpg"),
          ),
          Positioned (
            right: 0,
            bottom: 0,
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 177, 177, 176),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt),
                color: const Color.fromARGB(255, 255, 255, 255),
              )
            ),
          )
        ],
      ),
    );
  }
}
