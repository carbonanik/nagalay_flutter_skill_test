import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';

class FloatingActions extends StatelessWidget {
  final void Function() onFilter;
  final void Function() onSearch;

  const FloatingActions({
    required this.onFilter,
    required this.onSearch,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.filter,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.inversePrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Filter',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: SizedBox(
              height: 30,
              child: VerticalDivider(
                color: Colors.grey.shade300,
                width: 10,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.map,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.inversePrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Map',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
