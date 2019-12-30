import 'package:dio/dio.dart';
import 'package:spacex/model/capsules.dart';
import 'package:spacex/model/core.dart';
import 'package:spacex/model/dragons.dart';
import 'package:spacex/model/history.dart';
import 'package:spacex/model/info.dart';
import 'package:spacex/model/landpads.dart';
import 'package:spacex/model/launches.dart';
import 'package:spacex/model/missions.dart';
import 'package:spacex/model/rockets.dart';
import 'package:spacex/model/ships.dart';

class Api {
  Dio dio;
  Api() {
    init();
  }

  init() async {
    BaseOptions options =
        BaseOptions(baseUrl: 'https://api.spacexdata.com/v3/');
    dio = new Dio(options);
  }

  Future<Info> getInfo() async {
    final response = await dio.get('info');
    if (response.statusCode == 200) {
      return Info.fromJson(response.data);
    } else {
      throw Exception('Failed load data');
    }
  }

  Future<CapsulesList> getAllCapsules() async {
    final response = await dio.get('capsules');
    if (response.statusCode == 200) {
      return CapsulesList.fromJson(response.data);
    } else {
      throw Exception('Failed load data');
    }
  }

  Future<CoresList> getAllCore() async {
    final response = await dio.get('cores');
    if (response.statusCode == 200) {
      return CoresList.fromJson(response.data);
    } else {
      throw Exception('Failed load data');
    }
  }

  Future<DragonsList> getAllDragon() async {
    final response = await dio.get('dragons');
    if (response.statusCode == 200) {
      return DragonsList.fromJson(response.data);
    } else {
      throw Exception('Failed load data');
    }
  }

  Future<LandpadsList> getAllLandpads() async {
    final response = await dio.get('landpads');
    if (response.statusCode == 200) {
      return LandpadsList.fromJson(response.data);
    } else {
      throw Exception('Failed load data');
    }
  }

  Future<LaunchesList> getAllLaunches() async {
    final response = await dio.get('launches');
    if (response.statusCode == 200) {
      return LaunchesList.fromJson(response.data);
    } else {
      throw Exception('Failed load data');
    }
  }

  Future<MissionsList> getAllMissions() async {
    final response = await dio.get('landpads');
    if (response.statusCode == 200) {
      return MissionsList.fromJson(response.data);
    } else {
      throw Exception('Failed load data');
    }
  }

  Future<RocketsList> getAllRockets() async {
    final response = await dio.get('rockets');
    if (response.statusCode == 200) {
      return RocketsList.fromJson(response.data);
    } else {
      throw Exception('Failed load data');
    }
  }

  Future<HistoryList> getAllHistory() async {
    final response = await dio.get('history');
    if (response.statusCode == 200) {
      return HistoryList.fromJson(response.data);
    } else {
      throw Exception('Failed load data');
    }
  }

  Future<ShipsList> getAllShips() async {
    final response = await dio.get('ships');
    if (response.statusCode == 200) {
      return ShipsList.fromJson(response.data);
    } else {
      throw Exception('Failed load data');
    }
  }
}
