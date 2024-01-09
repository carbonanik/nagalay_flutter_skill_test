import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/model/group_filter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class GroupFilterNotifier extends StateNotifier<GroupFilter> {
  final Ref _ref;

  GroupFilterNotifier({required Ref ref})
      : _ref = ref,
        super(
          const GroupFilter(
            selectedProviderType: "",
            selectedServicePreference: "",
            selectedPriceBy: "",
            selectedAvailability: [],
            priceRange: SfRangeValues(20, 2000),
          ),
        );

  void updateFilter({
    String? selectedProviderType,
    String? selectedServicePreference,
    String? selectedPriceBy,
    List<String>? selectedAvailability,
    SfRangeValues? priceRange,
    String? selectedCategory1,
    String? selectedCategory2,
    String? selectedCategory3,
    String? selectedCategory4,
  }) {
    state = state.copyWith(
      selectedProviderType: selectedProviderType,
      selectedServicePreference: selectedServicePreference,
      selectedPriceBy: selectedPriceBy,
      selectedAvailability: selectedAvailability,
      priceRange: priceRange,
      selectedCategory1: selectedCategory1,
      selectedCategory2: selectedCategory2,
      selectedCategory3: selectedCategory3,
      selectedCategory4: selectedCategory4,
    );
  }

  void resetFilter() {
    state = const GroupFilter(
      selectedProviderType: "",
      selectedServicePreference: "",
      selectedPriceBy: "",
      selectedAvailability: [],
      priceRange: SfRangeValues(20, 2000),
    );
  }
}
