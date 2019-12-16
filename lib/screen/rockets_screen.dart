import 'package:flutter/material.dart';
import 'package:spacex/model/rockets.dart';
import 'package:spacex/screen/webview_scree.dart';

class RocketsScreen extends StatefulWidget {
  @override
  _RocketsScreenState createState() => _RocketsScreenState();
}

class _RocketsScreenState extends State<RocketsScreen> {
  Future<RocketsList> listRockets;

  @override
  void initState() {
    super.initState();
    listRockets = getAllRockets();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<RocketsList>(
          future: listRockets,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Rockets> data = snapshot.data.rockets;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.network(
                          '${data[index].images[0]}',
                          width: 60,
                        ),
                        title: Text('${data[index].name}'),
                        subtitle: Text('${data[index].description}'),
                        trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return WikipediaScreen(
                                    url: '${data[index].wikipedia}');
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
