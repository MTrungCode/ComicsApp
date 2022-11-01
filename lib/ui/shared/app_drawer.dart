import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Tìm truyện ...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Thể loại'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Đăng nhập'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
          ListTile(
            title: const Text('Đăng ký'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/signup');
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
