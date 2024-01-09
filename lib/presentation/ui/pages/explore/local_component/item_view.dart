import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_models_for_advertisements.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/local_component/item_view_image_slider.dart';

class ItemView extends StatelessWidget {
  final Advertisement advertisement;
  final bool deepShadow;

  const ItemView({
    required this.advertisement,
    this.deepShadow = false,
    super.key,
  });

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
              color: deepShadow ? textColor700 : secondaryColor100,
              spreadRadius: 3,
              blurRadius: deepShadow ? 10 : 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image slider
            ItemViewImageSlider(advertisement: advertisement),
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
              Text(
                advertisement.title ?? 'Title not found',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor700,
                ),
              ),
              const SizedBox(height: 8),
              // tag & location
              Row(
                children: [
                  // Tag // category
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: secondaryColor200,
                    ),
                    child: Text(
                      // 'Development',
                      advertisement.subCategory?.name ?? 'Category not found',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: textColor700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    Assets.icons.location,
                    colorFilter: const ColorFilter.mode(
                      textColor700,
                      BlendMode.srcIn,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      advertisement.address?.location?.addressText ?? 'Location not found',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: textColor700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              // service detail
              _buildServiceDetail(),
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
                      color: textColor700,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    '(5k)',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: textColor700,
                    ),
                  ),
                ],
              ),
              Text(
                advertisement.providerType == "SERVICE_PROVIDER"
                    ? '\$${advertisement.price?.hourly}/h'
                    : '\$${advertisement.price?.hourly}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: textColor700,
                ),
              ),
            ],
          ),
          // const SizedBox(height: 10),
        ],
      ),
    );
  }

  Row _buildServiceDetail() {
    bool serviceProvider = advertisement.providerType == "SERVICE_PROVIDER";
    bool isOnline = advertisement.serviceProviderType == "ONLINE";
    return Row(
      children: [
        // icon
        serviceProvider
            ? const Icon(
                Icons.home_repair_service_outlined,
                size: 20,
                color: textColor700,
              )
            : SvgPicture.asset(
                Assets.icons.student,
                colorFilter: const ColorFilter.mode(
                  textColor700,
                  BlendMode.srcIn,
                ),
              ),
        const SizedBox(width: 10),
        Text(
          serviceProvider ? 'Service' : '${advertisement.studentCapacity} Students',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor700,
          ),
        ),
        const SizedBox(width: 10),
        SvgPicture.asset(
          Assets.icons.chalkboard,
          colorFilter: const ColorFilter.mode(
            textColor700,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          isOnline ? 'Online' : 'Offline',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor700,
          ),
        )
      ],
    );
  }
}
