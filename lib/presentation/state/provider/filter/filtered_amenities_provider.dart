import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_amenities.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/amenities_provider.dart';

final amenitiesFilterStringProvider = StateProvider<String>((ref) => '');
final filteredAmenitiesProvider = StateProvider<List<Amenities>>((ref) {
  final amenities = ref.watch(amenitiesProvider).amenities;
  final amenitiesFilterString = ref.watch(amenitiesFilterStringProvider);
  return amenities
      .where(
        (amenity) => amenity.name!.toLowerCase().contains(
              amenitiesFilterString.toLowerCase(),
            ),
      )
      .toList();
});
