import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_amenities.dart';
import 'package:nagalay_flutter_skill_test/data/source/aminities_data_source.dart';

class AmenitiesNotifier extends ChangeNotifier {

  AmenitiesNotifier({required Ref ref}) {
    getAmenities();
  }

  final List<Amenities> _amenities = [];

  List<Amenities> get amenities => UnmodifiableListView(_amenities);

  Future<void> getAmenities() async {
    final dataSource = AmenitiesDataSource();
    final data = await dataSource.getAmenities();

    if (data != null) {
      List<Amenities> am = [];

      for (var element in data) {
        am.addAll(element.amenities ?? []);
      }

      _amenities.clear();
      _amenities.addAll(am);
      notifyListeners();
    }
  }
}
