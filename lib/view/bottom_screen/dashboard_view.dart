import 'package:flutter/material.dart';
import 'package:num_game/view/bottom_screen/about.dart';
import 'package:num_game/view/bottom_screen/cart.dart';
import 'package:num_game/view/bottom_screen/home.dart';
import 'package:num_game/view/bottom_screen/profile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> lstBottomScreen = const [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontFamily: 'Opensans Bold',fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.album_outlined), label: 'About'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
