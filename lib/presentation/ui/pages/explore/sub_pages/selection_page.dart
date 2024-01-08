import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/selection_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/service_advertisement_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_button.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_input_field.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_svg.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/sub_pages/select_area_page.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/sub_pages/select_category_page.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/sub_pages/select_city_page.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/sub_pages/select_sub_category_page.dart';

class SelectionPage extends ConsumerWidget {
  SelectionPage({super.key});

  final _cityController = TextEditingController();

  final _areaController = TextEditingController();

  final _categoryController = TextEditingController();

  final _subCategoryController = TextEditingController();

  void _onSelectCityTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SelectCityPage(),
      ),
    );
  }

  void _onSelectAreaTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SelectAreaPage(),
      ),
    );
  }

  void _onSelectCategoryTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SelectCategoryPage(),
      ),
    );
  }

  void _onSelectSubCategoryTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SelectSubCategoryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(selectionProvider);
    _cityController.text = selection.city ?? "";
    _areaController.text = selection.area ?? "";
    _categoryController.text = selection.category ?? "";
    _subCategoryController.text = selection.subCategory ?? "";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Sofol"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                MyInputField(
                  hintText: "Select your City",
                  labelText: "Select City",
                  prefixIcon: MySvg(Assets.icons.location),
                  onTap: () => _onSelectCityTap(context),
                  controller: _cityController,
                ),
                const SizedBox(height: 8),
                MyInputField(
                  hintText: "Select your Area",
                  labelText: "Select Area",
                  prefixIcon: MySvg(Assets.icons.location),
                  onTap: () => _onSelectAreaTap(context),
                  controller: _areaController,
                ),
                const SizedBox(height: 8),
                MyInputField(
                  hintText: "Select from list",
                  labelText: "Select Main Category",
                  prefixIcon: MySvg(Assets.icons.category1),
                  onTap: () => _onSelectCategoryTap(context),
                  controller: _categoryController,
                ),
                const SizedBox(height: 8),
                MyInputField(
                  hintText: "Select from list",
                  labelText: "Select Sub Category",
                  prefixIcon: MySvg(Assets.icons.category2),
                  onTap: () => _onSelectSubCategoryTap(context),
                  controller: _subCategoryController,
                )
              ],
            ),
            const Spacer(),
            Consumer(
              builder: (context, ref, child) {
                return MyButton(
                  title: "Clear",
                  onPressed: () {
                    ref.read(selectionProvider.notifier).clearSelection();
                    // Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  color: secondaryColor100,
                  textColor: Theme.of(context).colorScheme.inversePrimary,
                );
              },
            ),
            const SizedBox(height: 8),
            Consumer(
              builder: (context, ref, child) {
                return MyButton(
                  title: "Search",
                  onPressed: () {
                    // ref.read(serviceAdvertisementProvider.notifier).getAll();
                    Navigator.of(context).pop();
                  },
                  icon: MySvg(
                    Assets.icons.sofol,
                    size: 20,
                    color: Colors.white,
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
