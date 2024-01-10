import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/amenities_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/filter/filtered_amenities_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/filter/group_filter_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/custom_select_column_widget.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_button.dart';

class SofolAmenities extends StatelessWidget {
  const SofolAmenities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildTopBar(context),
              const Divider(color: secondaryColor200),
              Consumer(
                builder: (context, ref, child) {
                  final amenities = ref.watch(filteredAmenitiesProvider);
                  final filter = ref.watch(groupFilterProvider);

                  return Expanded(
                    child: SingleChildScrollView(
                      child: CustomCheckColumnWidget(
                        options: amenities.map((e) => e.name ?? "").toSet().toList(),
                        tappedOn: (value) {
                          final selectedSofolAmenities = [...ref.read(groupFilterProvider).selectedSofolAmenities];

                          if (selectedSofolAmenities.contains(value)) {
                            selectedSofolAmenities.remove(value);
                          } else {
                            selectedSofolAmenities.add(value);
                          }

                          ref
                              .read(groupFilterProvider.notifier)
                              .updateFilter(selectedSofolAmenities: selectedSofolAmenities);
                        },
                        selected: filter.selectedSofolAmenities,
                      ),
                    ),
                  );
                },
              ),
              MyButton(
                title: "Apply",
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTopBar(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.clear,
            color: textColor700,
          ),
        ),
        const SizedBox(width: 6),
        const Text(
          "Amenities",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor700,
          ),
        ),
        const Spacer(),
        Consumer(
          builder: (context, ref, child) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(groupFilterProvider.notifier).updateFilter(selectedSofolAmenities: ref.read(amenitiesProvider).amenities.map((e) => e.name ?? "").toSet().toList());
                  },
                  child: const Text(
                    "Select All",
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor700,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                const SizedBox(
                  height: 20,
                  child: VerticalDivider(),
                ),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () {
                    ref.read(groupFilterProvider.notifier).updateFilter(selectedSofolAmenities: []);
                  },
                  child: const Text(
                    "Clear",
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor700,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
