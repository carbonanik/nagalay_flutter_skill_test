import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_cities.dart';
import 'package:nagalay_flutter_skill_test/data/source/cities_data_source.dart';

class CitiesNotifier extends ChangeNotifier {
  final Ref _ref;

  CitiesNotifier({required Ref ref}) : _ref = ref {
    getCities();
  }

  final List<City> _cities = [];

  List<City> get cities => UnmodifiableListView(_cities);

  Future<void> getCities() async {
    final dataSource = CityDataSource();
    final data = await dataSource.getCities();
    if (data != null && data.cities != null) {
      _cities.clear();
      _cities.addAll(data.cities!);
      notifyListeners();
    }
  }
}
