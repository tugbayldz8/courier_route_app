import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sezin_soft/feature/home/model/location_model.dart';
import 'package:sezin_soft/gen/assets.gen.dart';

final class MarkerService {
  const MarkerService._();

  static Future<List<LocationModel>> fetchData() async {
    final String jsonString = await rootBundle.loadString(Assets.json.markers);
    final jsonData = jsonDecode(jsonString) as List<dynamic>;
    return jsonData.map((e) => LocationModel.fromJson(e)).toList();
  }
}
