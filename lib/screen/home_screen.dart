import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spacex/screen/dragons_screen.dart';
import 'package:spacex/screen/launches_scree.dart';
import 'package:spacex/screen/rockets_screen.dart';
import 'package:spacex/model/core.dart' as cores;
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  int _selectedIndex = 0;

  Future<void> getAllCores() async {
    cores.CoresList allCores = await cores.getAllCore();
    for (var cores in allCores.cores) {
      print("dataCores: ${cores.serial}");
    }
  }

  Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  @override
  void initState() {
    super.initState();
    getAllCores();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print('on message $message');
        return null;
      },
      onResume: (Map<String, dynamic> message) {
        print('on resume $message');
        return null;
      },
      onLaunch: (Map<String, dynamic> message) {
        print('on launch $message');
        return null;
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.getToken().then((token) {
      print(token);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _setScreen() {
    if (_selectedIndex == 0) {
      return RocketsScreen();
    } else if (_selectedIndex == 1) {
      return DragonsScreen();
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
      bottomNavigationBar: BottomNavyBar(
        items: [
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.rocket),
            title: Text('Rockets'),
          ),
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.spaceShuttle),
            title: Text('Dragons'),
          ),
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.satellite),
            title: Text('Launches'),
          ),
        ],
        selectedIndex: _selectedIndex,
        showElevation: true,
        itemCornerRadius: 8,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
