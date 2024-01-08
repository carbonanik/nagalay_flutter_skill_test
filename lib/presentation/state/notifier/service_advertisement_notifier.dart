import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_models_for_advertisements.dart';
import 'package:nagalay_flutter_skill_test/data/source/advertisements_data_source.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/selection_provider.dart';

class ServiceAdvertisementNotifier extends ChangeNotifier {
  final Ref _ref;

  ServiceAdvertisementNotifier({required Ref ref}) : _ref = ref {
    getAll();
    _ref.listen(selectionProvider, (previous, next) {
      getAll();
    });
  }

  final List<Advertisement> _advertisement = [];

  List<Advertisement> get advertisement => UnmodifiableListView(_advertisement);

  Future<void> getAll() async {
    final dataSource = AdvertisementsDataSource();
    final selection = _ref.read(selectionProvider);
    final advertisements = await dataSource.getAll(
      district: selection.city,
      area: selection.area,
      subCat: selection.category,
      nicheCat: selection.subCategory,
    );
    if (advertisements != null && advertisements.content != null) {
      _advertisement.clear();
      _advertisement.addAll(advertisements.content!);
      notifyListeners();
    }
  }
}
