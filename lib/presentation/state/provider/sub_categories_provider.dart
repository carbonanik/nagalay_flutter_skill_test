import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_sub_category.dart';
import 'package:nagalay_flutter_skill_test/data/source/sub_categories_data_source.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/notifier/sub_categories_notifier.dart';

final subCategoriesProvider = ChangeNotifierProvider<SubCategoriesNotifier>((ref) => SubCategoriesNotifier(ref: ref));

final getSubCategoriesByCategoryIdProvider = FutureProvider.family<List<SubCategory>, String>((ref, categoryId) async {
  final dataSource = SubCategoriesDataSource();
  final data = await dataSource.getSubCategories(categoryId);
  return data ?? [];
});
