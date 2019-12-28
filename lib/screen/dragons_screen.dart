import 'package:flutter/material.dart';
import 'package:spacex/model/dragons.dart';
import 'package:spacex/screen/webview_screen.dart';

class DragonsScreen extends StatefulWidget {
  @override
  _DragonsScreenState createState() => _DragonsScreenState();
}

class _DragonsScreenState extends State<DragonsScreen> {
  Future<DragonsList> listDragons;

  @override
  void initState() {
    super.initState();
    listDragons = getAllDragon();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<DragonsList>(
          future: listDragons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Dragons> data = snapshot.data.dragons;
              return ListView.builder(
                  itemCount: snapshot.data.dragons.length,
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

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
