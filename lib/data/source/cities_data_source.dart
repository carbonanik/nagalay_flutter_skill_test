import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_cities.dart';
import 'package:http/http.dart' as http;

class CityDataSource {
  CityDataSource();

  Future<AllCities?> getCities() async {
    final url = Uri.parse('http://52.77.83.48:8085/api/v/1.0.0/thako/public/district/get-all');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final model = AllCities.fromJson(data);
      return model;
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode}');
      }
    }
    return null;
  }
}
