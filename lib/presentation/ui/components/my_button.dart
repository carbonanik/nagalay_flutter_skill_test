import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final Widget? icon;
  final Color? color;
  final Color? textColor;

  const MyButton({
    required this.title,
    required this.onPressed,
    this.icon,
    this.color,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 10),
            onPressed: onPressed,
            color: color ?? Theme.of(context).colorScheme.inversePrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) icon!,
                if (icon != null) const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
