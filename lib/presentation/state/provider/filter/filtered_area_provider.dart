import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_cities.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/area_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/cities_provider.dart';

final areaFilterStringProvider = StateProvider<String>((ref) => '');
final filteredAreaProvider = StateProvider<List<String>>((ref) {
  final areas = ref.watch(areaProvider).area;
  final areasFilterString = ref.watch(areaFilterStringProvider);
  return areas.where((area) => area!.toLowerCase().contains(areasFilterString.toLowerCase())).toList();
});
