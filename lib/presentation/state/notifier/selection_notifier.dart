import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/selection.dart';

class SelectionNotifier extends StateNotifier<Selection> {
  SelectionNotifier() : super(Selection());

  void updateSelection({
    String? city,
    String? area,
    String? category,
    String? categoryId,
    String? subCategory,
  }) {
    state = state.copyWith(
      city: city ?? state.city,
      area: area ?? state.area,
      category: category ?? state.category,
      categoryId: categoryId ?? state.categoryId,
      subCategory: subCategory ?? state.subCategory,
    );
  }

  void clearSelection() {
    state = Selection();
  }
}
