import 'package:flutter/material.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Data',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: textColor500,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Icon(
            Icons.sentiment_dissatisfied,
            color: textColor500,
            size: 40,
          ),
        ],
      ),
    );
  }
}
