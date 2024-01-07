import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/explore_page.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/inbox/inbox_page.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/request/request_page.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/trips/trips_page.dart';

part 'local_components/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    const ExplorePage(),
    const RequestPage(),
    const InboxPage(),
    const TripsPage(),
  ];
  int selectedIndex = 0;
  void onSelect(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _BottomNavigationBar(onSelect: onSelect),
      body: pages[selectedIndex],
    );
  }
}
