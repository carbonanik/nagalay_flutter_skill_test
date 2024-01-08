import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_sub_category.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/sub_categories_provider.dart';

final subCategoriesFilterStringProvider = StateProvider<String>((ref) => '');
final filteredSubCategoriesProvider = StateProvider<List<SubCategory>>((ref) {
  final subCategories = ref.watch(subCategoriesProvider).subCategorise;
  final subCategoriesFilterString = ref.watch(subCategoriesFilterStringProvider);
  return subCategories.where((category) => category.name!.toLowerCase().contains(subCategoriesFilterString.toLowerCase())).toList();
});
