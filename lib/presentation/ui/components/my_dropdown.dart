import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  final List<String> items;
  final String value;
  final Function(String? value) onChanged;

  const MyDropdown({required this.items, required this.value, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey.shade100,
      ),
      child: DropdownButton(
        value: value,
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.keyboard_arrow_down),
        style: TextStyle(
          color: Colors.grey.shade700,
          // fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        underline: Container(),
        borderRadius: BorderRadius.circular(4),
        elevation: 0,
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
