import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_category.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/categories_provider.dart';

final categoriesFilterStringProvider = StateProvider<String>((ref) => '');
final filteredCategoriesProvider = StateProvider<List<Category>>((ref) {
  final categories = ref.watch(categoriesProvider).categories;
  final categoriesFilterString = ref.watch(categoriesFilterStringProvider);
  return categories.where((category) => category.name!.toLowerCase().contains(categoriesFilterString.toLowerCase())).toList();
});
