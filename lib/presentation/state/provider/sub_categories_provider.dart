import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/notifier/categories_notifier.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/notifier/sub_categories_notifier.dart';

final subCategoriesProvider = ChangeNotifierProvider<SubCategoriesNotifier>((ref) => SubCategoriesNotifier(ref: ref));
