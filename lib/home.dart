import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nuri_app/screens/home/dashboard.dart';
import 'package:nuri_app/screens/quran/quran.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List Screens = [DashboardPage(), QuranPage()];
  int _selectedIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashboardPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF035A2F),
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              LucideIcons.home,
              color: _selectedIndex == 0 ? Color(0xFF035A2F) : Color(0xFFEDC855),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LucideIcons.bookOpen,
              color: _selectedIndex == 1 ? Color(0xFF035A2F) : Color(0xFFEDC855),
            ),
            label: "Qur'an",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LucideIcons.alarmCheck,
              color: _selectedIndex == 2 ? Color(0xFF035A2F) : Color(0xFFEDC855),
            ),
            label: "Alarm",
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Screens[_selectedIndex],
    );
  }
}
