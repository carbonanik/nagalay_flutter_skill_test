import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_category.dart';
import 'package:nagalay_flutter_skill_test/data/source/categories_data_source.dart';

class CategoriesNotifier extends ChangeNotifier {
  final Ref _ref;

  CategoriesNotifier({required Ref ref}) : _ref = ref {
    getCategories();
  }

  final List<Category> _cities = [];

  List<Category> get cities => UnmodifiableListView(_cities);

  Future<void> getCategories() async {
    final dataSource = CategoriesDataSource();
    final data = await dataSource.getCategories();
    if (data != null) {
      _cities.clear();
      _cities.addAll(data);
      notifyListeners();
    }
  }
}
