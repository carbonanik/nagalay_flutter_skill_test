import 'package:flutter/material.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';

class ItemViewImageSlider extends StatefulWidget {
  const ItemViewImageSlider({super.key});

  @override
  State<ItemViewImageSlider> createState() => _ItemViewImageSliderState();
}

class _ItemViewImageSliderState extends State<ItemViewImageSlider> {
  final _list = [
    Assets.images.placeHolder1.path,
    Assets.images.placeholder2.path,
    Assets.images.nagalayLogo1.path,
  ];

  int _currentIndex = 0;
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
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
        children: [_buildPageView(), _buildBottomPageIndicator(), _buildRoundButtonRow()],
      ),
    );
  }

  PageView _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      children: _list.map((e) => Image.asset(e)).toList(),
    );
  }

  Positioned _buildBottomPageIndicator() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _list.map(
          (e) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == _list.indexOf(e) ? secondaryColor100 : textColor500,
              ),
              // color: _currentIndex == _list.indexOf(e) ? textColor700 : secondaryColor200
            );
          },
        ).toList(),
      ),
    );
  }

  Widget _buildRoundButtonRow() {
    final icons = [Icons.favorite_outline, Icons.share, Icons.add];
    return Positioned(
      left: 8,
      top: 8,
      child: Column(
        children: [
          _buildRoundButton(icons[0], () {}),
          const SizedBox(height: 4),
          _buildRoundButton(icons[1], () {}),
          const SizedBox(height: 4),
          _buildRoundButton(icons[2], () {}),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildRoundButton(IconData icon, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20,
        width: 20,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: secondaryColor100,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: textColor700,
          size: 12,
        ),
      ),
    );
  }
}
