import 'package:flutter/material.dart';
import 'package:spacex/screen/dragons_screen.dart';
import 'package:spacex/screen/launches_scree.dart';
import 'package:spacex/screen/rockets_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _setScreen() {
    if (_selectedIndex == 0) {
      return RocketsScreen();
    } else if (_selectedIndex == 1) {
      return  DragonsScreen();
    } else {
      return LaunchesScreen();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX'),
      ),
      body: _setScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Rockets'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Dragons'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Launches'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );

  }
}
