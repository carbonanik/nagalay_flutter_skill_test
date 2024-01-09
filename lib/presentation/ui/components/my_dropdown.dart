import 'package:flutter/material.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';

class MyDropdown extends StatelessWidget {
  final List<String> items;
  final String value;
  final Function(String? value) onChanged;

  const MyDropdown({
    required this.items,
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: secondaryColor100,
      ),
      child: DropdownButton(
        value: value,
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.keyboard_arrow_down),
        style: const TextStyle(
          color: textColor700,
          fontSize: 14,
        ),
        underline: Container(),
        borderRadius: BorderRadius.circular(4),
        elevation: 10,
        dropdownColor: secondaryColor100,
        items: List.generate(
          items.length,
          (index) {
            return DropdownMenuItem<String>(
              value: items[index],
              child: Text(items[index]),
            );
          },
        ),
        onChanged: onChanged,
      ),
    );
  }
}
