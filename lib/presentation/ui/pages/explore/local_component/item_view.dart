import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image slider
            Image.asset(
              Assets.images.placeHolder1.path,
              width: 110,
            ),
            const SizedBox(width: 10),
            Expanded(child: _buildDetails()),
            // details
          ],
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              // title
              const Text(
                'Learn Database engineering',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              // tag & location
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey.shade300,
                    ),
                    child: const Text('Development',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black54)),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    Assets.icons.location,
                    colorFilter: const ColorFilter.mode(
                      Colors.black54,
                      BlendMode.srcIn,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Gazipur, Dhaka, Bangladesh',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black54),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  // icon
                  SvgPicture.asset(Assets.icons.student,
                      colorFilter: const ColorFilter.mode(
                        Colors.black54,
                        BlendMode.srcIn,
                      )),
                  const SizedBox(width: 10),
                  const Text('20 Students',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black54)),
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    Assets.icons.chalkboard,
                    colorFilter: const ColorFilter.mode(
                      Colors.black54,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 26),
          // rating and price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.star,
                    colorFilter: ColorFilter.mode(
                      Colors.orangeAccent.shade100,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    '4.5',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    '(5k)',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const Text(
                '\$10',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          // const SizedBox(height: 10),
        ],
      ),
    );
  }
}
