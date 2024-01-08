import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/selection.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/notifier/selection_notifier.dart';

final selectionProvider = StateNotifierProvider<SelectionNotifier, Selection>((ref) {
  return SelectionNotifier();
});
