import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_category.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_sub_category.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/filter/filtered_categories_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/filter/filtered_sub_categories_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/selection_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_input_field.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_svg.dart';

class SelectSubCategoryPage extends StatelessWidget {
  const SelectSubCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Select Sub Category"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final selection = ref.watch(selectionProvider);
          if (selection.category == null) {
            return const Center(child: Text("Please Select Category",
              style: TextStyle(
                color: textColor500,
                fontSize: 16,
                fontWeight: FontWeight.w600

              )
            ));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                MyInputField(
                  hintText: "Search sub category",
                  prefixIcon: MySvg(Assets.icons.category2),
                  onChanged: (value) {
                    ref.read(subCategoriesFilterStringProvider.notifier).state = value;
                  },
                ),
                const SizedBox(height: 8),
                _buildSubCategoriesList()
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubCategoriesList() {
    return Consumer(
      builder: (context, ref, child) {
        final subCategories = ref.watch(filteredSubCategoriesProvider);
        return Expanded(
          child: ListView.builder(
            itemCount: subCategories.length,
            itemBuilder: (context, index) {
              return _buildSubCategoryItem(
                subCategories[index],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildSubCategoryItem(SubCategory subCategory) {
    return Column(
      children: [
        Divider(color: secondaryColor200, height: 5),
        Consumer(
          builder: (context, ref, child) {
            return GestureDetector(
              onTap: () {
                ref.read(selectionProvider.notifier).updateSelection(subCategory: subCategory.name);
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
                    Text(subCategory.name ?? ""),
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
