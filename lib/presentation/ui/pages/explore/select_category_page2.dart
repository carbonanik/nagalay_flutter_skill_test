import 'package:flutter/material.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_button.dart';

class SelectCategoryPage extends StatefulWidget {
  const SelectCategoryPage({super.key});

  @override
  State<SelectCategoryPage> createState() => _SelectCategoryPageState();
}

class _SelectCategoryPageState extends State<SelectCategoryPage> {
  final List<String> categoryList = [
    "Category 1",
    "Category 2",
    "Category 3",
    "Category 4",
    "Category 5",
  ];

  final List<String> subCategoryList = [
    "Sub Category 1",
    "Sub Category 2",
    "Sub Category 3",
    "Sub Category 4",
    "Sub Category 5",
  ];

  int selectedIndex = 0;

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
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        categoryList.length,
                        (index) => Column(
                          children: [
                            Container(
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
                                    categoryList[index],
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
                            // index == selectedIndex ?
                            ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: List.generate(
                                subCategoryList.length,
                                (index) => Container(
                                    margin: const EdgeInsets.symmetric(vertical: 5),
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(),
                                    child: Text(
                                      subCategoryList[index],
                                    )),
                              ),
                            )
                            // : Container(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            MyButton(
              title: "Apply",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
