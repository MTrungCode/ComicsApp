import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screen.dart';

Future<void> main() async {
  await dotenv.load();
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
    const FavoriteListScreen(),
    //const EditBookScreen(),
    // const CartScreen(),
    const OrdersScreen(),
    const UserScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ComicsAppTheme.light();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthManager(),
        ),
        ChangeNotifierProxyProvider<AuthManager, BookManager>(
          create: (ctx) => BookManager(),
          update: (ctx, authManager, bookManager) {
            bookManager!.authToken = authManager.authToken;
            return bookManager;
          },
        ),
      ],
      child: Consumer<AuthManager>(builder: (ctx, authManager, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: authManager.isAuth
              ? Scaffold(
                  body: _pages[_selectedIndex],
                  bottomNavigationBar: BottomNavigationBar(
                    selectedItemColor: Colors.white,
                    selectedFontSize: 14,
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
                )
              : FutureBuilder(
                  future: authManager.tryAutoLogin(),
                  builder: (ctx, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? const SplashScreen()
                        : const AuthScreen();
                  },
                ),
          routes: {},
          onGenerateRoute: (settings) {
            if (settings.name == BookDetailScreen.routeName) {
              final bookId = settings.arguments as String;
              return MaterialPageRoute(
                builder: (contx) {
                  return BookDetailScreen(
                    contx.read<BookManager>().findById(bookId),
                  );
                },
              );
            }
            return null;
          },
        );
      }),
    );
  }
}
