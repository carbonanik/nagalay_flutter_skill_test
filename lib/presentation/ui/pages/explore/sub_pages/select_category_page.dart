import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_category.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/filter/filtered_categories_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/selection_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_input_field.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_svg.dart';

class SelectCategoryPage extends StatelessWidget {
  const SelectCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Select Category"),
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
                  hintText: "Search main category",
                  prefixIcon: MySvg(Assets.icons.category1),
                  onChanged: (value) {
                    ref.read(categoriesFilterStringProvider.notifier).state = value;
                  },
                );
              },
            ),
            const SizedBox(height: 8),
            _buildCategoriesList()
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesList() {
    return Consumer(
      builder: (context, ref, child) {
        final categories = ref.watch(filteredCategoriesProvider);
        return Expanded(
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return _buildCategoryItem(
                categories[index],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildCategoryItem(Category category) {
    return Column(
      children: [
        const Divider(color: secondaryColor200, height: 5),
        Consumer(
          builder: (context, ref, child) {
            return GestureDetector(
              onTap: () {
                ref.read(selectionProvider.notifier).updateSelection(
                      category: category.name,
                      categoryId: category.id,
                    );
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    MySvg(Assets.icons.category1),
                    Text(category.name ?? ""),
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
