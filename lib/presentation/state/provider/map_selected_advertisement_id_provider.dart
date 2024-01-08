import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/notifier/map_selected_advertisement_id_notifier.dart';

final mapSelectedAdvertisementIdProvider = StateNotifierProvider((ref) => MapSelectedAdvertisementIdNotifier(ref: ref));
