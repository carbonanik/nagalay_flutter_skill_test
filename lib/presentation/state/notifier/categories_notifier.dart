import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_category.dart';
import 'package:nagalay_flutter_skill_test/data/source/categories_data_source.dart';

class CategoriesNotifier extends ChangeNotifier {

  CategoriesNotifier({required Ref ref}) {
    getCategories();
  }

  final List<Category> _categories = [];

  List<Category> get categories => UnmodifiableListView(_categories);

  Future<void> getCategories() async {
    final dataSource = CategoriesDataSource();
    final data = await dataSource.getCategories();
    if (data != null) {
      _categories.clear();
      _categories.addAll(data);
      notifyListeners();
    }
  }
}
