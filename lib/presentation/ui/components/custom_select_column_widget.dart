import 'package:flutter/material.dart';

class CustomCheckColumnWidget extends StatelessWidget {
  final List<String> options;
  final Function(String value) tappedOn;
  final List<String> selected;
  final double spacing;

  const CustomCheckColumnWidget({
    required this.options,
    required this.tappedOn,
    required this.selected,
    this.spacing = 10,
    Key? key,
  }) : super(key: key);

  Widget customRadioButton(String text, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        tappedOn(options[index]);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              (selected.contains(options[index])) ? Icons.check_box : Icons.check_box_outline_blank,
              color: (selected.contains(options[index])) ? Theme.of(context).colorScheme.inversePrimary : Colors.grey,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: (selected.contains(options[index])) ? Theme.of(context).colorScheme.inversePrimary : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...List.generate(
          options.length,
          (index) {
            return customRadioButton(options[index], index, context);
          },
        ).toList()
      ],
    );
  }
}
