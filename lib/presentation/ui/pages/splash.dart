import 'package:flutter/material.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Image.asset(
                Assets.images.nagalayLogo1.path,
                // cacheWidth: 330,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              Assets.images.featuredGraphics1.path,
              // cacheWidth: 400,
            ),
          ),
        ],
      ),
    );
  }
}
