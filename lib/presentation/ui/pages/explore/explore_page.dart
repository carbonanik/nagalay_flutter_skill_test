import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/selection_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/service_advertisement_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_button.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_dropdown.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_svg.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/no_data.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/local_component/floating_actions.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/local_component/item_view.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/sub_pages/selection_page.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/map/map_view_page.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActions(
        onFilter: () {},
        onMap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MapViewPage(),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // selected location
            _buildSelectedLocation(),

            // selected category
            _buildSelectedCategory(),

            // select button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MyButton(
                title: "Select",
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SelectionPage(),
                  ),
                ),
                icon: MySvg(
                  Assets.icons.sofol,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // result counts
            _buildResultCount(),
            const SizedBox(height: 8),

            // result list
            _buildItemList()
          ],
        ),
      ),
    );
  }

  Padding _buildResultCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Text(
            "287 results",
            style: TextStyle(
              color: textColor700,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          // drop down
          MyDropdown(
            items: const [
              "Relevance",
              "Newest",
              "Oldest",
            ],
            value: 'Relevance',
            onChanged: (value) {},
          )
        ],
      ),
    );
  }

  Widget _buildSelectedCategory() {
    return Consumer(
      builder: (context, ref, child)  {
        final selection = ref.watch(selectionProvider);
        return Column(
          children: [
            Divider(
              color: secondaryColor200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // category
                  Row(
                    children: [
                      SvgPicture.asset(Assets.icons.category1,
                          colorFilter: const ColorFilter.mode(
                            textColor700,
                            BlendMode.srcIn,
                          )),
                      const SizedBox(width: 10),
                      Text(
                        selection.category ?? "Category",
                        style: const TextStyle(color: textColor700, fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                    child: VerticalDivider(),
                  ),
                  // sub category
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.category2,
                        colorFilter: const ColorFilter.mode(
                          textColor700,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        selection.subCategory ?? "Sub Category",
                        style: const TextStyle(color: textColor700, fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              color: secondaryColor200,
            ),
          ],
        );
      }
    );
  }

  Widget _buildSelectedLocation() {
    return Consumer(builder: (context, ref, child) {
      final selection = ref.watch(selectionProvider);
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            SvgPicture.asset(Assets.icons.location,
                colorFilter: const ColorFilter.mode(
                  textColor700,
                  BlendMode.srcIn,
                )),
            const SizedBox(width: 10),
            Text(
              selection.city ?? "City",
              style: const TextStyle(
                color: textColor700,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(Assets.icons.location,
                colorFilter: const ColorFilter.mode(
                  textColor700,
                  BlendMode.srcIn,
                )),
            const SizedBox(width: 10),
            Text(
              selection.area ?? "Area",
              style: const TextStyle(color: textColor700, fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ],
        ),
      );
    });
  }

  Expanded _buildItemList() {
    return Expanded(
      child: Container(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Consumer(builder: (context, ref, child) {
          final serviceAdvertisementList = ref.watch(serviceAdvertisementProvider);

          return ListView.builder(
            itemCount: serviceAdvertisementList.advertisement.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: index == (serviceAdvertisementList.advertisement.length - 1) ? 76 : 0,
                ),
                child: ItemView(
                  advertisement: serviceAdvertisementList.advertisement[index],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
