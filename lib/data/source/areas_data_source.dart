import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_area.dart';
import 'package:http/http.dart' as http;

class AreaDataSource {
  AreaDataSource();

  Future<AllArea?> getAreas() async {
    final url = Uri.parse('http://52.77.83.48:8083/api/v/1.0.0/sofol/public/area/get-all');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final model = AllArea.fromJson(data);
      return model;
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode}');
      }
    }
    return null;
  }
}
