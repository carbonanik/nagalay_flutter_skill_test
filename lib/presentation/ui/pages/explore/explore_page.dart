import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_button.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_dropdown.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/no_data.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/local_component/floating_actions.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/local_component/item_view.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActions(
        onFilter: () {},
        onSearch: () {},
      ),
      body: SafeArea(
        child: Column(
          children: [
            // selected location

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.icons.location,
                      colorFilter: ColorFilter.mode(
                        Colors.grey.shade700,
                        BlendMode.srcIn,
                      )),
                  const SizedBox(width: 10),
                  Text(
                    "Cox's Bazar",
                    style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const Spacer(),
                  SvgPicture.asset(Assets.icons.location,
                      colorFilter: ColorFilter.mode(
                        Colors.grey.shade700,
                        BlendMode.srcIn,
                      )),
                  const SizedBox(width: 10),
                  Text(
                    "Cox's Bazar",
                    style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ),

            // selected category

            Divider(
              color: Colors.grey.shade300,
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
                          colorFilter: ColorFilter.mode(
                            Colors.grey.shade700,
                            BlendMode.srcIn,
                          )),
                      const SizedBox(width: 10),
                      Text(
                        "Development",
                        style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600, fontSize: 16),
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
                        colorFilter: ColorFilter.mode(
                          Colors.grey.shade700,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Database",
                        style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
            ),

            // select button

            const MyButton(),
            const SizedBox(height: 8),
            // result counts

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "287 results",
                    style: TextStyle(
                      color: Colors.grey.shade700,
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
            ),
            const SizedBox(height: 8),

            // result list
            _buildItemList()
          ],
        ),
      ),
    );
  }

  Expanded _buildItemList() {
    return Expanded(
      child: Container(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          // clipBehavior: Clip.none,
          itemCount: 20,
          itemBuilder: (context, index) {
            return const ItemView();
          },
        ),
      ),
    );
  }
}
