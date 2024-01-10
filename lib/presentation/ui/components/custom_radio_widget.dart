import 'package:flutter/material.dart';

class CustomRadioWidget extends StatelessWidget {
  final List<String> options;
  final Function(String value) valueChanged;
  final String value;
  final double spacing;

  const CustomRadioWidget({
    required this.options,
    required this.valueChanged,
    required this.value,
    this.spacing = 10,
    Key? key,
  }) : super(key: key);

  Widget customRadioButton(String text, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        valueChanged(options[index]);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            (value == options[index]) ? Icons.radio_button_checked : Icons.radio_button_unchecked,
            color: (value == options[index]) ? Colors.green : Colors.grey,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: (value == options[index]) ? Theme.of(context).colorScheme.inversePrimary : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.end,
      spacing: spacing,
      runSpacing: 10,
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
