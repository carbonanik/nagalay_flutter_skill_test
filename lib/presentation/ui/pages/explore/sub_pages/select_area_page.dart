import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/filter/filtered_area_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/selection_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_input_field.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_svg.dart';

class SelectAreaPage extends StatelessWidget {
  const SelectAreaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Select Area"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Consumer(
              builder: (context, ref, child) {
                return MyInputField(
                  hintText: "Search area",
                  prefixIcon: MySvg(Assets.icons.search),
                  onChanged: (value) {
                    ref.read(areaFilterStringProvider.notifier).state = value;
                  },
                );
              },
            ),
            const SizedBox(height: 8),
            _buildAreaList()
          ],
        ),
      ),
    );
  }

  Widget _buildAreaList() {
    return Consumer(
      builder: (context, ref, child) {
        final areas = ref.watch(filteredAreaProvider);
        return Expanded(
          child: ListView.builder(
            itemCount: areas.length,
            itemBuilder: (context, index) {
              return _buildAreaItem(
                areas[index],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildAreaItem(String area) {
    return Column(
      children: [
        const Divider(color: secondaryColor200, height: 5),
        Consumer(
          builder: (context, ref, child) {
            return GestureDetector(
              onTap: () {
                ref.read(selectionProvider.notifier).updateSelection(area: area);
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    MySvg(Assets.icons.location),
                    Text(area),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

