import 'package:flutter/material.dart';
import 'screen.dart';

void main() {
  runApp(const ComicsApp());
}

class ComicsApp extends StatefulWidget {
  const ComicsApp({Key? key}) : super(key: key);

  @override
  State<ComicsApp> createState() => _ComicsAppState();
}

class _ComicsAppState extends State<ComicsApp> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    Container(
      color: Colors.redAccent,
    ),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.deepPurpleAccent,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ComicsAppTheme.light();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          selectedFontSize: 12,
          iconSize: 20,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Trang chủ',
              backgroundColor: Colors.blueGrey,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Yêu thích',
              backgroundColor: Colors.redAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_travel),
              label: 'Đơn hàng',
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_present),
              label: 'Hồ sơ của tôi',
              backgroundColor: Colors.deepPurpleAccent,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
