import 'package:flutter/material.dart';
import 'package:plant_monitor_app/screens/camera_screen.dart';
import './main_Screen.dart';
import './profile_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static String screenRoute = 'tab_screen';
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int num) {
    setState(() {
      _selectedScreenIndex = num;
    });
  }

  int _selectedScreenIndex = 0;
  final List<Widget> _screens = [
    MainScreen(),
    CameraScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left:60),
          child: Text('Plant Monitor'),
        ),
      ),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'camera',
      ),  
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
