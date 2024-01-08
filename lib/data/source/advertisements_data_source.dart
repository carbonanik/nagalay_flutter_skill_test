import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nagalay_flutter_skill_test/data/links.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_models_for_advertisements.dart';

class AdvertisementsDataSource {
  Future<AllAdvertisements?> getAll({
    String sorting = 'LATEST',
    String? district,
    String? area,
    String? subCat,
    String? nicheCat,
    String? providerType,
    String? serProtype,
    String? hourPerWeek,
    String? priceType,
    String? minPrice,
    String? maxPrice,
    String? amenities,
  }) async {
    final queryParameters = {
      'sorting': sorting,
      'district': district,
      'area': area,
      'subCat': subCat,
      'nicheCat': nicheCat,
      'providerType': providerType,
      'serProtype': serProtype,
      'hourPerWeek': hourPerWeek,
      'priceType': priceType,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'amenities': amenities,
    };

    // remove null values
    queryParameters.removeWhere((key, value) => value == null || value == '');

    final url = Uri.http(authority, serviceAdvertisementPath, queryParameters);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final model = AllAdvertisements.fromJson(data);
      return model;
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode}');
      }
    }
    return null;
  }
}
