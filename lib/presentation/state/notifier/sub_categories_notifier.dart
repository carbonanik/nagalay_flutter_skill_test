import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_category.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_cities.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_sub_category.dart';
import 'package:nagalay_flutter_skill_test/data/source/categories_data_source.dart';
import 'package:nagalay_flutter_skill_test/data/source/cities_data_source.dart';
import 'package:nagalay_flutter_skill_test/data/source/sub_categories_data_source.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/categories_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/cities_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/selection_provider.dart';

class SubCategoriesNotifier extends ChangeNotifier {
  final Ref _ref;

  SubCategoriesNotifier({required Ref ref}) : _ref = ref {
    _ref.listen(selectionProvider, (previous, next) {
      getSubCategories();
    });
  }

  final List<SubCategory> _subCategories = [];

  List<SubCategory> get subCategorise => UnmodifiableListView(_subCategories);

  Future<void> getSubCategories() async {
    final dataSource = SubCategoriesDataSource();
    final selection = _ref.read(selectionProvider);
    if (selection.categoryId == null) {
      return;
    }
    final data = await dataSource.getSubCategories(selection.categoryId!);
    if (data != null) {
      _subCategories.clear();
      _subCategories.addAll(data);
      notifyListeners();
    }
  }
}
