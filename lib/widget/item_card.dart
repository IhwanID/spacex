import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String image;
  ItemCard({this.name, this.image});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width * 0.5,
        child: ListTile(
          leading: Image.network(
            image,
            width: 60,
          ),
          title: Text(name),
        ),
      ),
    );
  }
}
