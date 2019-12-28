import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spacex/model/dragons.dart';
import 'package:spacex/model/launches.dart';
import 'package:spacex/screen/cores_screen.dart';
import 'package:spacex/screen/dragons_screen.dart';
import 'package:spacex/screen/info_screen.dart';
import 'package:spacex/screen/launches_screen.dart';
import 'package:spacex/screen/rockets_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:spacex/widget/item_card.dart';

import 'launches_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  int _selectedIndex = 2;

  Future<DragonsList> listDragons;
  Future<LaunchesList> listLaunches;

  Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
  }

  @override
  void initState() {
    super.initState();
    listLaunches = getAllLaunches();
    listDragons = getAllDragon();

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
    } else if (_selectedIndex == 2) {
      return buildHomeScreen();
    } else if (_selectedIndex == 3) {
      return LaunchesScreen();
    } else {
      return CoreScreen();
    }
  }

  buildHomeScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX'),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.infoCircle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Launchers'),
                  GestureDetector(
                    child: Text('See All'),
                    onTap: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                  ),
                ],
              )),
          FutureBuilder<LaunchesList>(
              future: listLaunches,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Launches> data = snapshot.data.launches;
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 24.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          var item = data[index];
                          return ItemCard(
                            image: item.links.patch,
                            name: item.name,
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return Center(child: CircularProgressIndicator());
              }),
          Container(
              margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Dragons'),
                  GestureDetector(
                    child: Text('See All'),
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                  ),
                ],
              )),
          FutureBuilder<DragonsList>(
              future: listDragons,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Dragons> data = snapshot.data.dragons;
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 24.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.dragons.length,
                        itemBuilder: (context, index) {
                          var item = data[index];
                          return ItemCard(
                            image: item.images[0],
                            name: item.name,
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return Center(child: CircularProgressIndicator());
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(FontAwesomeIcons.home),
            title: Text('Home'),
          ),
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.satellite),
            title: Text('Launches'),
          ),
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.meteor),
            title: Text('Others'),
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
