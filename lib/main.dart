import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/theme_data.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/explore_page.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/sub_pages/fliter_pages.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/sub_pages/select_category_page.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/sub_pages/select_city_page.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/sub_pages/selection_page.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/home/home_page.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/map/map_view_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nagalay Flutter Skill Test',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: HomePage(),
    );
  }
}

