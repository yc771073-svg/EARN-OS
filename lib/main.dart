import 'package:flutter/material.dart';
import 'screens/world_selector.dart';
import 'screens/marketplace.dart';
import 'screens/settings.dart';
import 'screens/delivery.dart';

void main() { runApp(EarnOSApp()); }

class EarnOSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.black, primaryColor: Color(0xFFD4AF37)),
      home: MainNav(),
    );
  }
}

class MainNav extends StatefulWidget {
  @override
  _MainNavState createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _index = 0;
  final _pages = [WorldSelector(), MarketplaceScreen(), DeliveryScreen(), SettingsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Color(0xFFD4AF37),
        unselectedItemColor: Colors.white54,
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.public), label: "World"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Brands"),
          BottomNavigationBarItem(icon: Icon(Icons.delivery_dining), label: "Delivery"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
