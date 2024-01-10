import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/notifier/amenities_notifier.dart';

final amenitiesProvider = ChangeNotifierProvider<AmenitiesNotifier>(
  (ref) => AmenitiesNotifier(ref: ref),
);
