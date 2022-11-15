import 'dart:math';

import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 94.0,
      ),
      transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.deepPurpleAccent.shade700,
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: Colors.white10,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Text(
        'ComicsApp',
        style: TextStyle(
          color: Theme.of(context).textTheme.headline6?.color,
          fontSize: 40,
          fontFamily: 'Anton',
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}