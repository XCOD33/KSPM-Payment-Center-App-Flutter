import 'package:flutter/material.dart';
import 'package:kspm_payment_center_app/home.dart';
import 'package:kspm_payment_center_app/pembayaranku.dart';
import 'package:kspm_payment_center_app/setting.dart';

// void main() {
//   runApp(const Nav());
// }

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
            ),
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.money),
            label: 'Pembayaranku',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
      body: <Widget>[
        Home(),
        Pembayaranku(),
        Setting(),
      ][currentPageIndex],
    );
  }
}
