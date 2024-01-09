import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_models_for_advertisements.dart';
import 'package:nagalay_flutter_skill_test/data/source/advertisements_data_source.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/filter/group_filter_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/selection_provider.dart';

class ServiceAdvertisementNotifier extends ChangeNotifier {
  final Ref _ref;

  ServiceAdvertisementNotifier({required Ref ref}) : _ref = ref {
    getAll();
    _ref.listen(selectionProvider, (previous, next) {
      getAll();
    });
    // _ref.listen(groupFilterProvider, (previous, next) {
    //   getAll();
    // });
  }

  final List<Advertisement> _advertisement = [];

  List<Advertisement> get advertisement => UnmodifiableListView(_advertisement);

  Future<void> getAll() async {
    final dataSource = AdvertisementsDataSource();
    final selection = _ref.read(selectionProvider);
    // final filter = _ref.read(groupFilterProvider);

    final advertisements = await dataSource.getAll(
      district: selection.city,
      area: selection.area,
      subCat: selection.category,
      nicheCat: selection.subCategory,
      // minPrice: filter.priceRange.start.toString(),
      // maxPrice: filter.priceRange.end.toString(),
      // amenities: filter.amenities,
      // hourPerWeek: filter.selectedAvailability,
      // priceType: filter.selectedPriceBy.toLowerCase(),
      // providerType: filter.selectedProviderType.toUpperCase().replaceAll(RegExp(r'\s+'), '_'),
    );
    if (advertisements != null && advertisements.content != null) {
      _advertisement.clear();
      _advertisement.addAll(advertisements.content!);
      notifyListeners();
    }
  }
}
