import 'package:flutter/material.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';

class MyInputField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function()? onTap;
  final Function(String value)? onChanged;
  final TextEditingController? controller;

  const MyInputField({
    required this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText!,
            style: const TextStyle(color: textColor700),
          ),
        const SizedBox(height: 4),
        TextField(
          onTap: onTap,
          onChanged: onChanged,
          controller: controller,
          canRequestFocus: onTap == null,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: secondaryColor100,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ],
    );
  }
}
