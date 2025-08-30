import 'package:flutter/material.dart';
import 'package:uniapp/features/analytics/views/analytics_view.dart';
import 'package:uniapp/features/home/views/home_view.dart';
import 'package:uniapp/features/settings/settings_view.dart';

class QuizAppBottomNav extends StatefulWidget {
  const QuizAppBottomNav({super.key});

  @override
  State<QuizAppBottomNav> createState() => _QuizAppBottomNavState();
}

class _QuizAppBottomNavState extends State<QuizAppBottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomeView(), AnalyticsView(), SettingsView()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        type: BottomNavigationBarType.shifting,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
