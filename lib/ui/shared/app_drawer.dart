import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../search_box.dart';
import '../auth/auth_manager.dart';
import '../admin/admin_book_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final controller = TextEditingController();
  var _expanded = false;
  final authManager = AuthManager();

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
              onTap: () {
                showSearch(
                  context: context,
                  delegate: SearchBox(),
                );
              },
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                buildType(),
                if (_expanded) buildExpandedType()
              ],
            ),
          ),
          context.read<AuthManager>().isAdmin
              ? ListTile(
                  title: const Text('Quản lý truyện'),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AdminBookScreen.routeName,
                    );
                  },
                )
              : const Divider(),
          // ListTile(
          //   title: const Text('Đăng ký'),
          //   onTap: () {
          //     Navigator.of(context).pushReplacementNamed('/signup');
          //   },
          // ),
          ListTile(
            title: const Text('Đăng xuất'),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..pushReplacementNamed('/');
              context.read<AuthManager>().logout();
            },
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget buildType() {
    return ListTile(
      title: const Text('Thể loại'),
      trailing: IconButton(
        icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
        onPressed: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
      ),
    );
  }

  Widget buildExpandedType() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Center(
        child: Wrap(
          spacing: 12,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Tiểu thuyết phiêu lưu'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Kỳ ảo'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Kỳ ảo hài hước'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Võ thuật'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Action'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Fantasy'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Manga'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Shounen'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Comedy'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Drama'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Mystery'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Romance'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('School Life'),
            ),
          ],
        ),
      ),
    );
  }
}
