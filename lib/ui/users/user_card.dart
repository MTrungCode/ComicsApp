import 'package:flutter/material.dart';

import 'circle_image.dart';

class UserCard extends StatelessWidget {
  final String userName;
  final String position;
  final ImageProvider? imageProvider;

  const UserCard({
    Key? key,
    required this.userName,
    required this.position,
    this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: imageProvider,
                imageRadius: 28,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName),
                  Text(position),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
