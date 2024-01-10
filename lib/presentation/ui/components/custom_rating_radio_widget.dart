import 'package:flutter/material.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_svg.dart';

class CustomRatingRadioWidget extends StatelessWidget {
  final List<String> options;
  final Function(String value) valueChanged;
  final String value;
  final double spacing;

  const CustomRatingRadioWidget({
    required this.options,
    required this.valueChanged,
    required this.value,
    this.spacing = 10,
    Key? key,
  }) : super(key: key);

  Widget customRadioButton(String text, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        valueChanged(options[index]);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: (value == options[index]) ? Colors.green : Colors.grey,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              (value == options[index]) ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: (value == options[index]) ? Colors.green : Colors.grey,
            ),
            //
            MySvg(Assets.icons.star, color: (value == options[index]) ? Colors.orangeAccent.shade200 : Colors.grey),
            const SizedBox(width: 2),
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
