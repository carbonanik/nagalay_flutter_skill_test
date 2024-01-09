import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/filter/group_filter_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_button.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/local_component/custom_radio_widget.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/local_component/custom_select_widget.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/sub_pages/filter_select_category_page.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterPage extends ConsumerStatefulWidget {
  const FilterPage({super.key});

  @override
  ConsumerState<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends ConsumerState<FilterPage> {
  // choices for filter
  final providerTypes = ["Both", "Teacher", "Service Provider"];
  final servicePreferences = ["Both", "Online", "Offline"];
  final priceBy = ["Hourly", "Daily", "Weekly", "Monthly"];
  final availability = ["Any", "10h", "20h", "30h", "40h", "50h", "60h", "70h"];

  // sf sliders
  final double minVal = 20;
  final double maxVal = 2000;
  late final SfRangeValues _values = SfRangeValues(minVal, maxVal);
  late final RangeController _rangeController;

  @override
  void initState() {
    super.initState();
    _rangeController = RangeController(start: _values.start, end: _values.end);
  }

  @override
  void dispose() {
    _rangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final price = ref.read(groupFilterProvider).priceRange;

    _rangeController.start = price.start;
    _rangeController.end = price.end;

    final width = MediaQuery.of(context).size.width;
    final count = width / 16;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildTopBar(context),
              const Divider(color: secondaryColor200),
              _buildScroll(context, count),
              MyButton(
                title: "Ok",
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
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.clear,
            color: textColor700,
          ),
        ),
        const SizedBox(width: 6),
        const Text(
          "Filter",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor700,
          ),
        ),
        const Spacer(),
        Consumer(
          builder: (context, ref, child) {
            return GestureDetector(
              onTap: () {
                ref.read(groupFilterProvider.notifier).resetFilter();
              },
              child: const Text(
                "Clear",
                style: TextStyle(
                  fontSize: 20,
                  color: textColor700,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Expanded _buildScroll(BuildContext context, double count) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildTitle("Price"),
            const SizedBox(height: 10),
            _buildPriceSelector(context, count),
            _buildMinMaxLable(),
            const Divider(color: secondaryColor200),
            Consumer(builder: (context, ref, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  _buildProviderTypeRadio(ref),
                  const SizedBox(height: 8),
                  const Divider(color: secondaryColor200),
                  const SizedBox(height: 20),
                  _buildTitle("Sofol Category"),
                  const SizedBox(height: 15),
                  _buildCategoryItem(ref.watch(groupFilterProvider).selectedCategory1, (category) {
                    ref.read(groupFilterProvider.notifier).updateFilter(
                          selectedCategory1: category,
                        );
                  }),
                  const SizedBox(height: 5),
                  _buildCategoryItem(ref.watch(groupFilterProvider).selectedCategory2, (category) {
                    ref.read(groupFilterProvider.notifier).updateFilter(
                          selectedCategory2: category,
                        );
                  }),
                  const SizedBox(height: 5),
                  _buildCategoryItem(ref.watch(groupFilterProvider).selectedCategory3, (category) {
                    ref.read(groupFilterProvider.notifier).updateFilter(
                          selectedCategory3: category,
                        );
                  }),
                  const SizedBox(height: 5),
                  _buildCategoryItem(ref.watch(groupFilterProvider).selectedCategory4, (category) {
                    ref.read(groupFilterProvider.notifier).updateFilter(
                          selectedCategory4: category,
                        );
                  }),
                  const SizedBox(height: 20),
                  _buildTitle("Service Preference"),
                  const SizedBox(height: 15),
                  _buildServicePrefRadio(ref),
                  const SizedBox(height: 20),
                  _buildTitle("Price By"),
                  const SizedBox(height: 15),
                  _buildPriceByRadio(ref),
                  const SizedBox(height: 10),
                  const Divider(color: secondaryColor200),
                  const SizedBox(height: 10),
                  _buildTitle("Availability Per Week"),
                  const SizedBox(height: 20),
                  _buildAvailabilityRadio(ref),
                  const SizedBox(height: 20),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Row _buildMinMaxLable() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$$minVal",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor700,
          ),
        ),
        Text(
          "\$$maxVal",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor700,
          ),
        ),
      ],
    );
  }

  CustomRadioWidget _buildProviderTypeRadio(WidgetRef ref) {
    return CustomRadioWidget(
      valueChanged: (value) {
        ref.read(groupFilterProvider.notifier).updateFilter(
              selectedProviderType: value,
            );
      },
      options: providerTypes,
      value: ref.watch(groupFilterProvider).selectedProviderType,
    );
  }

  CustomRadioWidget _buildServicePrefRadio(WidgetRef ref) {
    return CustomRadioWidget(
      valueChanged: (value) {
        ref.read(groupFilterProvider.notifier).updateFilter(
              selectedServicePreference: value,
            );
      },
      options: servicePreferences,
      value: ref.watch(groupFilterProvider).selectedServicePreference,
      spacing: 50,
    );
  }

  CustomRadioWidget _buildPriceByRadio(WidgetRef ref) {
    return CustomRadioWidget(
      valueChanged: (value) {
        ref.read(groupFilterProvider.notifier).updateFilter(
              selectedPriceBy: value,
            );
      },
      options: priceBy,
      value: ref.watch(groupFilterProvider).selectedPriceBy,
      spacing: 40,
    );
  }

  CustomCheckWidget _buildAvailabilityRadio(WidgetRef ref) {
    return CustomCheckWidget(
      tappedOn: (value) {
        final selectedAvailability = [...ref.read(groupFilterProvider).selectedAvailability];

        if (selectedAvailability.contains(value)) {
          selectedAvailability.remove(value);
        } else {
          selectedAvailability.add(value);
        }
        ref.read(groupFilterProvider.notifier).updateFilter(
              selectedAvailability: selectedAvailability,
            );
      },
      options: availability,
      selected: ref.watch(groupFilterProvider).selectedAvailability,
    );
  }

  Widget _buildCategoryItem(
    String? category,
    Function(String category) applyCategory,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FilterSelectCategoryPage(
              applyCategory: applyCategory,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: secondaryColor200,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Text(
              category ?? "Category",
              style: const TextStyle(
                color: textColor600,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: textColor700,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Text _buildTitle(title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor700,
      ),
    );
  }

  SizedBox _buildPriceSelector(BuildContext context, double count) {
    return SizedBox(
      height: 40,
      child: Consumer(builder: (context, ref, child) {
        return SfRangeSelector(
          enableTooltip: true,
          min: minVal,
          max: maxVal,
          interval: 1,
          controller: _rangeController,
          labelPlacement: LabelPlacement.onTicks,
          activeColor: Theme.of(context).colorScheme.inversePrimary,
          onChanged: (value) {
            ref.read(groupFilterProvider.notifier).updateFilter(priceRange: value);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                count.toInt(),
                (index) => Container(
                  width: 8,
                  height: 5 + Random().nextInt(30).toDouble(),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
