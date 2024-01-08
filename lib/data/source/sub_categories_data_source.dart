import 'dart:convert';

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_category.dart' show Category;
import 'package:http/http.dart' as http;
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_category.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_sub_category.dart';

class SubCategoriesDataSource {
  SubCategoriesDataSource();

  Future<List<SubCategory>?> getSubCategories(String categoryId) async {
    final url = Uri.parse(
        'http://52.77.83.48:8083/api/v/1.0.0/sofol/public/advertisement/niche-category/get-all/$categoryId');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      final List<SubCategory> model = [];
      for (var element in data) {
        model.add(SubCategory.fromJson(element));
      }
      return model;
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode}');
      }
    }
    return null;
  }
}
