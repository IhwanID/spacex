import 'package:flutter/material.dart';
import 'package:spacex/model/launches.dart';
import 'package:spacex/screen/webview_scree.dart';

class LaunchesScreen extends StatefulWidget {
  @override
  _LaunchesScreenState createState() => _LaunchesScreenState();
}

class _LaunchesScreenState extends State<LaunchesScreen> {
  Future<LaunchesList> listLaunches;

  @override
  void initState() {
    super.initState();
    listLaunches = getAllLaunches();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<LaunchesList>(
          future: listLaunches,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Launches> data = snapshot.data.launches;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.network(
                          '${data[index].links.patch}',
                          width: 60,
                        ),
                        title: Text('${data[index].name}'),
                        subtitle: Text('${data[index].details}'),
                        trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return WikipediaScreen(
                                    url: '${data[index].links.wikipedia}');
                              }));
                            },
                            child: Icon(Icons.arrow_right)),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
