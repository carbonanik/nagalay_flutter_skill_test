import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';

class MySvg extends StatelessWidget {
  final String asset;
  final Color? color;
  final double? size;

  const MySvg(
    this.asset, {
    this.color,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 24,
      width: size ?? 24,
      child: Center(
        child: SvgPicture.asset(
          asset,
          colorFilter: ColorFilter.mode(
            color ?? textColor700,
            BlendMode.srcIn,
          ),
          height: size,
          width: size,
        ),
      ),
    );
  }
}
