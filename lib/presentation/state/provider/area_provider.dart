import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/notifier/area_notifier.dart';

final areaProvider = ChangeNotifierProvider<AreaNotifier>((ref) => AreaNotifier(ref: ref));
