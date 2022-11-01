import 'package:flutter/material.dart';
import 'ui/shared/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comics Store',
          style: Theme.of(context).textTheme.headline2,
        ),
        actions: [
          buildShoppingCart(),
          buildNotificationButton(),
        ],
      ),
      drawer: const AppDrawer(),
    );
  }

  Widget buildNotificationButton() {
    return IconButton(
      icon: const Icon(Icons.notifications),
      onPressed: () {},
    );
  }

  Widget buildShoppingCart() {
    return IconButton(
      icon: const Icon(Icons.shopping_cart),
      onPressed: () {},
    );
  }
}
