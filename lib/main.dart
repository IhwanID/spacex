import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex/screen/home_screen.dart';
import 'package:spacex/utils/theme.dart';

void main() => runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ThemeNotifier())],
    child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX App',
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      home: HomeScreen(),
    );
  }
}
