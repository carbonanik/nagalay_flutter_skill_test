import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/source/areas_data_source.dart';

class AreaNotifier extends ChangeNotifier {

  AreaNotifier({required Ref ref}) {
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
