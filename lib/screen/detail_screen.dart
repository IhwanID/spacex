import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({this.name, this.image, this.description});

  final String name;
  final String image;
  final String description;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(widget.image),
          Text(widget.name),
          Text(widget.description)
        ],
      ),
    );
  }
}
