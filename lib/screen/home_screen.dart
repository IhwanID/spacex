import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spacex/api.dart';
import 'package:spacex/model/dragons.dart';
import 'package:spacex/model/launches.dart';
import 'package:spacex/screen/cores_screen.dart';
import 'package:spacex/screen/dragons_screen.dart';
import 'package:spacex/screen/info_screen.dart';
import 'package:spacex/screen/launches_scree.dart';
import 'package:spacex/screen/rockets_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  int _selectedIndex = 0;

  Future<List<Dragons>> listDragons;
  Future<List<Launches>> listLaunches;

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
    listLaunches = fetchAllLaunches();
    listDragons = fetchAllDragons();

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
    return SafeArea(
        child: Scaffold(
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
          Text('Launchers'),
          FutureBuilder<List<Launches>>(
              future: listLaunches,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Launches> data = snapshot.data;
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(8.0),
                            color: Colors.indigo,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: ListTile(
                              leading: Image.network(
                                '${data[index].links.missionPatch}',
                                width: 60,
                              ),
                              title: Text('${data[index].missionName}'),
                              subtitle: Text('${data[index].details}'),
                            ),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return Center(child: CircularProgressIndicator());
              }),
          Text('Dragons'),
          FutureBuilder<List<Dragons>>(
              future: listDragons,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Dragons> data = snapshot.data;
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(8.0),
                            color: Colors.yellow,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: ListTile(
                              leading: Image.network(
                                '${data[index].flickrImages[0]}',
                                width: 60,
                              ),
                              title: Text('${data[index].name}'),
                              subtitle: Text('${data[index].description}'),
                            ),
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
    ));
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
