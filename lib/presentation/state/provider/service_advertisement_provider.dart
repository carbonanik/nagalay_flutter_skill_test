import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_models_for_advertisements.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/notifier/service_advertisement_notifier.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/filter/group_filter_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/order_provider.dart';

final serviceAdvertisementProvider = ChangeNotifierProvider((ref) => ServiceAdvertisementNotifier(ref: ref));

final orderedServiceAdvertisementProvider = StateProvider<List<Advertisement>>((ref) {
  final notifier = ref.watch(serviceAdvertisementProvider);
  final order = ref.watch(serviceAdvertisementOrderProvider);
  final filter = ref.watch(groupFilterProvider);

  final advertisements = [...notifier.advertisement];
  if (order == ServiceAdvertisementOrder.newest) {
    advertisements.sort((a, b) => b.id!.compareTo(a.id!));
  } else if (order == ServiceAdvertisementOrder.oldest) {
    advertisements.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
  }

  if (filter.selectedCategory1 != null) {
    advertisements.removeWhere((element) => element.subCategory?.name != filter.selectedCategory1);
  } else if (filter.selectedCategory2 != null) {
    advertisements.removeWhere((element) => element.subCategory?.name != filter.selectedCategory2);
  } else if (filter.selectedCategory3 != null) {
    advertisements.removeWhere((element) => element.subCategory?.name != filter.selectedCategory3);
  } else if (filter.selectedCategory4 != null) {
    advertisements.removeWhere((element) => element.subCategory?.name != filter.selectedCategory4);
  }

  advertisements.removeWhere((element) => element.price == null || element.price!.hourly! < filter.priceRange.start);
  advertisements.removeWhere((element) => element.price == null || element.price!.hourly! > filter.priceRange.end);

  if (filter.selectedProviderType != "") {
    advertisements.removeWhere((element) => element.providerType != filter.selectedProviderType.toUpperCase().replaceAll(RegExp(r'\s+'), '_'));
  }

  if (filter.selectedServicePreference != "") {
    advertisements.removeWhere((element) => element.serviceProviderType != filter.selectedServicePreference.toUpperCase());
  }

  return advertisements;
});
