import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_cities.dart';
import 'package:nagalay_flutter_skill_test/data/source/areas_data_source.dart';
import 'package:nagalay_flutter_skill_test/data/source/cities_data_source.dart';

class AreaNotifier extends ChangeNotifier {
  final Ref _ref;

  AreaNotifier({required Ref ref}) : _ref = ref {
    getCities();
  }

  final List<String> _area = [];

  List<String> get area => UnmodifiableListView(_area);

  Future<void> getCities() async {
    final dataSource = AreaDataSource();
    final data = await dataSource.getAreas();
    if (data != null && data.data != null) {
      _area.clear();
      _area.addAll(data.data!);
      notifyListeners();
    }
  }
}
