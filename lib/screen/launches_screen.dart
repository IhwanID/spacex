import 'package:flutter/material.dart';
import 'package:spacex/model/launches.dart';
import 'package:spacex/screen/detail_screen.dart';
import 'package:spacex/service/api.dart';

class LaunchesScreen extends StatefulWidget {
  @override
  _LaunchesScreenState createState() => _LaunchesScreenState();
}

class _LaunchesScreenState extends State<LaunchesScreen> {
  Future<LaunchesList> listLaunches;

  @override
  void initState() {
    super.initState();
    listLaunches = Api().getAllLaunches();
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
                    var item = data[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.network(
                          '${item.links.patch}',
                          width: 60,
                        ),
                        title: Text('${item.name}'),
                        subtitle: Text('${item.details}'),
                        trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailScreen(
                                  name: item.name,
                                  image: item.links.patch,
                                  description: item.details,
                                );
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
