import 'package:flutter/material.dart';
import 'package:spacex/model/info.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  Future<Info> info;
  @override
  void initState() {
    super.initState();
    info = getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Apps'),
      ),
      body: FutureBuilder<Info>(
          future: info,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Info data = snapshot.data;
              return Text('${data.summary}');
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
