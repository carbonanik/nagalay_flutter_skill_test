import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/data/links.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_models_for_advertisements.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/favorite_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';

class ItemViewImageSlider extends StatefulWidget {
  final Advertisement advertisement;

  const ItemViewImageSlider({required this.advertisement, super.key});

  @override
  State<ItemViewImageSlider> createState() => _ItemViewImageSliderState();
}

class _ItemViewImageSliderState extends State<ItemViewImageSlider> {
  final List<String> _list1 = [
    Assets.images.placeHolder1.path,
    Assets.images.placeholder2.path,
    Assets.images.nagalayLogo1.path,
  ];
  final List<String> _list2 = [
    Assets.images.placeholder2.path,
    Assets.images.placeHolder1.path,
    Assets.images.nagalayLogo1.path,
  ];

  int _currentIndex = 0;
  final _pageController = PageController();

  late final list = widget.advertisement.providerType == "SERVICE_PROVIDER" ? _list1 : _list2;
  late List<String> liveImage;
  late List<String> allImages;

  @override
  void initState() {
    super.initState();
    final lp = widget.advertisement.galleryUploads?.map((e) => e.path).toList();

    lp?.removeWhere((e) => e == null);

    liveImage = lp?.cast<String>() ?? [];
    allImages = liveImage + list;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 150,
      child: Stack(
        children: [
          _buildPageView(),
          _buildBottomPageIndicator(),
          _buildRoundButtonRow(),
        ],
      ),
    );
  }

  PageView _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (value) {
        _onPageChanged(value);
      },
      children: allImages.map((e) {
        if (e.startsWith("assets/images/")) {
          return Image.asset(e);
        }
        return Image.network(
          imageBaseUrl + e,
          fit: BoxFit.cover,
        );
      }).toList(),
    );
  }

  Positioned _buildBottomPageIndicator() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: allImages.indexed.map(
          (e) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == e.$1 ? secondaryColor100 : textColor500,
              ),
              // color: _currentIndex == _list.indexOf(e) ? textColor700 : secondaryColor200
            );
          },
        ).toList(),
      ),
    );
  }

  Widget _buildRoundButtonRow() {
    return Positioned(
      left: 8,
      top: 8,
      child: Consumer(builder: (context, ref, child) {
        final ids = ref.watch(favoriteProvider);
        return Column(
          children: [
            _buildRoundButton(
              ids.contains(widget.advertisement.id) ? Icons.favorite : Icons.favorite_outline,
              () {
                if (widget.advertisement.id != null) {
                  ref.read(favoriteProvider.notifier).toggleFavorite(
                        widget.advertisement.id!,
                      );
                }
              },
            ),
            const SizedBox(height: 4),
            _buildRoundButton(Icons.share, () {}),
            const SizedBox(height: 4),
            _buildRoundButton(Icons.add, () {}),
            const SizedBox(height: 4),
          ],
        );
      }),
    );
  }

  Widget _buildRoundButton(IconData icon, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: InkWell(
        child: Container(
          height: 26,
          width: 26,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: secondaryColor100,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: textColor700,
            size: 17,
          ),
        ),
      ),
    );
  }
}
