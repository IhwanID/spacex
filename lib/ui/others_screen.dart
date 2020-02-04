import 'package:flutter/material.dart';
import 'package:spacex/model/capsules.dart';
import 'package:spacex/model/core.dart';
import 'package:spacex/model/landpads.dart';
import 'package:spacex/service/api.dart';

class CoreScreen extends StatefulWidget {
  @override
  _CoreScreenState createState() => _CoreScreenState();
}

class _CoreScreenState extends State<CoreScreen> {
  Future<CoresList> coresList;
  Future<CapsulesList> capsulesList;
  Future<LandpadsList> lanpadsList;
  final Api api = new Api();

  @override
  void initState() {
    super.initState();
    coresList = api.getAllCore();
    capsulesList = api.getAllCapsules();
    lanpadsList = api.getAllLandpads();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('SpaceX App'),
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Capsules',
                ),
                Tab(
                  text: 'Cores',
                ),
                Tab(
                  text: 'Lanpads',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [buildCapsulesScreen(), buildCoreScreen(), buildLandpadsTab()],
          ),
        ),
      ),
    );
  }

  buildCoreScreen() {
    return Container(
      child: FutureBuilder<CoresList>(
          future: coresList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              CoresList data = snapshot.data;
              return ListView.builder(
                  itemCount: data.cores.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            '${data.cores[index].serial}',
                          ),
                          subtitle: Text(
                            '${data.cores[index].details}',
                          ),
                          trailing: Text(
                            '${data.cores[index].status}',
                          ),
                        ),
                        Divider()
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  buildCapsulesScreen() {
    return Container(
      child: FutureBuilder<CapsulesList>(
          future: capsulesList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              CapsulesList data = snapshot.data;
              return ListView.builder(
                  itemCount: data.capsules.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            '${data.capsules[index].serial}',
                          ),
                          subtitle: Text(
                            '${data.capsules[index].details}',
                          ),
                          trailing: Text(
                            '${data.capsules[index].status}',
                          ),
                        ),
                        Divider()
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  buildLandpadsTab(){
    return Container(
      child: FutureBuilder<LandpadsList>(
          future: lanpadsList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              LandpadsList data = snapshot.data;
              return ListView.builder(
                  itemCount: data.landpads.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            '${data.landpads[index].name}',
                          ),
                          subtitle: Text(
                            '${data.landpads[index].details}', textAlign: TextAlign.justify,
                          ),
                          trailing: Text(
                            '${data.landpads[index].status}',
                          ),
                        ),
                        Divider()
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
