import 'package:flutter/material.dart';
import 'package:spacex/model/core.dart';

class CoreScreen extends StatefulWidget {
  @override
  _CoreScreenState createState() => _CoreScreenState();
}

class _CoreScreenState extends State<CoreScreen> {
  Future<CoresList> coresList;

  @override
  void initState() {
    super.initState();
    coresList = getAllCore();
  }

  @override
  Widget build(BuildContext context) {
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

            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
