import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_cities.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/cities_provider.dart';

final cityFilterStringProvider = StateProvider<String>((ref) => '');
final filteredCitiesProvider = StateProvider<List<City>>((ref) {
  final cities = ref.watch(citiesProvider).cities;
  final cityFilterString = ref.watch(cityFilterStringProvider);
  return cities.where((city) => city.districtName!.toLowerCase().contains(cityFilterString.toLowerCase())).toList();
});
