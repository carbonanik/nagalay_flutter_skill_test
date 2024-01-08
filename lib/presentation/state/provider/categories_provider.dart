import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/notifier/categories_notifier.dart';

final categoriesProvider = ChangeNotifierProvider<CategoriesNotifier>((ref) => CategoriesNotifier(ref: ref));
