// final providerTypes = ["Both", "Teacher", "Service Provider"];
// final servicePreferences = ["All", "Online", "Offline"];
// final priceBy = ["Hourly", "Daily", "Weekly", "Monthly"];
// final availability = ["All", "Available", "Not Available"];

import 'package:syncfusion_flutter_sliders/sliders.dart';

class GroupFilter {
  final String selectedProviderType;
  final String selectedServicePreference;
  final String selectedPriceBy;
  final List<String> selectedAvailability;
  final SfRangeValues priceRange;
  final String? selectedCategory1;
  final String? selectedCategory2;
  final String? selectedCategory3;
  final String? selectedCategory4;

  const GroupFilter({
    required this.selectedProviderType,
    required this.selectedServicePreference,
    required this.selectedPriceBy,
    required this.selectedAvailability,
    required this.priceRange,
    this.selectedCategory1,
    this.selectedCategory2,
    this.selectedCategory3,
    this.selectedCategory4,
  });

  GroupFilter copyWith({
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
    return GroupFilter(
      selectedProviderType: selectedProviderType ?? this.selectedProviderType,
      selectedServicePreference: selectedServicePreference ?? this.selectedServicePreference,
      selectedPriceBy: selectedPriceBy ?? this.selectedPriceBy,
      selectedAvailability: selectedAvailability ?? this.selectedAvailability,
      priceRange: priceRange ?? this.priceRange,
      selectedCategory1: selectedCategory1 ?? this.selectedCategory1,
      selectedCategory2: selectedCategory2 ?? this.selectedCategory2,
      selectedCategory3: selectedCategory3 ?? this.selectedCategory3,
      selectedCategory4: selectedCategory4 ?? this.selectedCategory4,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is GroupFilter &&
        other.selectedProviderType == selectedProviderType &&
        other.selectedServicePreference == selectedServicePreference &&
        other.selectedPriceBy == selectedPriceBy &&
        other.selectedAvailability == selectedAvailability &&
        other.priceRange == priceRange &&
        other.selectedCategory1 == selectedCategory1 &&
        other.selectedCategory2 == selectedCategory2 &&
        other.selectedCategory3 == selectedCategory3 &&
        other.selectedCategory4 == selectedCategory4;
  }

  @override
  int get hashCode =>
      selectedProviderType.hashCode ^
      selectedServicePreference.hashCode ^
      selectedPriceBy.hashCode ^
      selectedAvailability.hashCode ^
      priceRange.hashCode ^
      selectedCategory1.hashCode ^
      selectedCategory2.hashCode ^
      selectedCategory3.hashCode ^
      selectedCategory4.hashCode;
}
