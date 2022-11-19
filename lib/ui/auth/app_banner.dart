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
        vertical: 20.0,
        horizontal: 40.0,
      ),
      transform: Matrix4.skewX(50 * pi / 360)..translate(-26.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: const Color.fromARGB(255, 136, 55, 248),
        gradient: LinearGradient(
          colors: [Colors.red.shade300, Colors.blue.shade400],
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.white10,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Text(
        'Comics Store',
        style: TextStyle(
          color: Theme.of(context).textTheme.headline6?.color,
          fontSize: 40,
          fontFamily: 'Anton',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
