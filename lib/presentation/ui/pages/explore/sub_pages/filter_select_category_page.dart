import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_category.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_model_for_sub_category.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/categories_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/sub_categories_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_button.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);
final selectedSubCategoryTempProvider = StateProvider<String>((ref) => "");

class FilterSelectCategoryPage extends StatelessWidget {
  final Function(String category) applyCategory;

  const FilterSelectCategoryPage({
    required this.applyCategory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Sofol Categories"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Make your selection",
              style: TextStyle(
                color: textColor500,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCategory(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Consumer(builder: (context, ref, child) {
              return MyButton(
                title: "Apply",
                onPressed: () {
                  applyCategory(
                    ref.read(selectedSubCategoryTempProvider),
                  );
                  Navigator.of(context).pop();
                },
              );
            })
          ],
        ),
      ),
    );
  }

  Widget _buildCategory() {
    return Consumer(
      builder: (context, ref, child) {
        final categoryList = ref.watch(categoriesProvider).categories;
        final selectedIndex = ref.watch(selectedIndexProvider);
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            categoryList.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(selectedIndexProvider.notifier).state = index;
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
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
                            categoryList[index].name ?? "",
                            style: const TextStyle(
                              color: textColor600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          RotatedBox(
                            quarterTurns: selectedIndex == index ? 1 : 0,
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: textColor700,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  index == selectedIndex ? _buildSubCategoryList(categoryList, index) : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSubCategoryList(List<Category> categoryList, int index) {
    return Consumer(
      builder: (context, ref, child) {
        final subCategoryAsyncValue = ref.watch(getSubCategoriesByCategoryIdProvider(categoryList[index].id ?? ""));
        final selectedSubCategory = ref.watch(selectedSubCategoryTempProvider);
        return subCategoryAsyncValue.map(
          data: (data) {
            return ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                data.value.length,
                (index) => _buildSubCategoryItem(ref, data, index, selectedSubCategory, context),
              ),
            );
          },
          error: (error) => const Text("Error"),
          loading: (loading) => const Text("Loading..."),
        );
      },
    );
  }

  GestureDetector _buildSubCategoryItem(
      WidgetRef ref, AsyncData<List<SubCategory>> data, int index, String selectedSubCategory, BuildContext context) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedSubCategoryTempProvider.notifier).state = data.value[index].name ?? "";
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selectedSubCategory == data.value[index].name
              ? Theme.of(context).colorScheme.inversePrimary
              : Colors.transparent,
        ),
        child: Text(
          data.value[index].name ?? "",
          style: TextStyle(
            color: selectedSubCategory == data.value[index].name ? Colors.white : textColor600,
          ),
        ),
      ),
    );
  }
}
