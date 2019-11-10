import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WikipediaScreen extends StatefulWidget {
  WikipediaScreen({this.url});
  final url;

  @override
  _WikipediaScreenState createState() => _WikipediaScreenState();
}

class _WikipediaScreenState extends State<WikipediaScreen> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        appBar: AppBar(
          title: Text('Wikipedia'),
        ),
        url: widget.url);
  }
}
