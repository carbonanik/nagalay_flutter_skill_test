import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_models_for_advertisements.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/service_advertisement_provider.dart';

class MapSelectedAdvertisementIdNotifier extends StateNotifier<String?> {
  final Ref _ref;

  MapSelectedAdvertisementIdNotifier({
    required Ref ref,
  })  : _ref = ref,
        super(null);

  void updateSelectedAdvertisementId(String? selectedAdvertisementId) {
    state = selectedAdvertisementId;
  }

  void clearSelectedAdvertisementId() {
    state = null;
  }

  Advertisement? getSelectedAdvertisement() {
    if (state == null) {
      return null;
    }
    return _ref
        .watch(serviceAdvertisementProvider)
        .advertisement
        .firstWhere((advertisement) => advertisement.id == state);
  }
}
