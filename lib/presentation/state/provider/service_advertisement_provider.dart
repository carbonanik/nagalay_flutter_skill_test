import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/notifier/service_advertisement_notifier.dart';

final serviceAdvertisementProvider = ChangeNotifierProvider((ref) => ServiceAdvertisementNotifier(ref: ref));
