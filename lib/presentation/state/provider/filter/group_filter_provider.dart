import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/model/group_filter.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/notifier/group_filter_notifier.dart';

final groupFilterProvider = StateNotifierProvider<GroupFilterNotifier, GroupFilter>(
  (ref) => GroupFilterNotifier(ref: ref),
);
