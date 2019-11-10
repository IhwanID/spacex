import 'package:spacex/model/dragons.dart';
import 'package:spacex/model/launches.dart';
import 'package:spacex/model/rockets.dart';
import 'package:http/http.dart' as http;

Future<List<Rockets>> fetchAllRockets() async {
  final response = await http.get('https://api.spacexdata.com/v3/rockets');
  if (response.statusCode == 200) {
    return rocketsFromJson(response.body);
  } else {
    throw Exception('Failed to load post');
  }
}

Future<List<Dragons>> fetchAllDragons() async {
  final response = await http.get('https://api.spacexdata.com/v3/dragons');
  if (response.statusCode == 200) {
    return dragonsFromJson(response.body);
  } else {
    throw Exception('Failed to load post');
  }
}

Future<List<Launches>> fetchAllLaunches() async {
  final response = await http.get('https://api.spacexdata.com/v3/launches');
  if (response.statusCode == 200) {
    return launchesFromJson(response.body);
  } else {
    throw Exception('Failed to load post');
  }
}
