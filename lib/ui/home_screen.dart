import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:spacex/model/dragons.dart';
import 'package:spacex/model/launches.dart';
import 'package:spacex/model/rockets.dart';
import 'package:spacex/ui/others_screen.dart';
import 'package:spacex/ui/info_screen.dart';
import 'package:spacex/ui/launches_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:spacex/service/api.dart';
import 'package:spacex/utils/theme.dart';
import 'package:spacex/widget/item_card.dart';
import 'launches_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  int _selectedIndex = 0;

  final Api api = new Api();

  Future<DragonsList> listDragons;
  Future<LaunchesList> listLaunches;
  Future<RocketsList> rocketList;

  @override
  void initState() {
    super.initState();
    listLaunches = api.getAllLaunches();
    listDragons = api.getAllDragon();
    rocketList = api.getAllRockets();

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
      return buildHomeScreen();
    } else if (_selectedIndex == 1) {
      return Center(child: Text('//TODO'));
    } else if (_selectedIndex == 2) {
      return Center(child: Text('//TODO'));
    } else if (_selectedIndex == 3) {
      return LaunchesScreen();
    } else {
      return CoreScreen();
    }
  }

  buildHomeScreen() {
    final theme = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX'),
        actions: <Widget>[
          IconButton(icon: theme.myTheme == MyTheme.Light ? Icon(FontAwesomeIcons.solidSun) : Icon(FontAwesomeIcons.solidMoon), onPressed: () => theme.switchTheme()),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Rockets'),
                ],
              )),
          FutureBuilder<RocketsList>(
              future: rocketList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Rockets> data = snapshot.data.rockets;
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 16.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          var item = data[index];
                          return Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(item.images[0]),
                              ),
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
          Container(
              margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Dragons'),
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
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 16.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          var item = data[index];
                          return Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(item.links.patch),
                              ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _setScreen(),
      bottomNavigationBar: BottomNavyBar(
        items: [
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.home),
            title: Text('Home'),
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
