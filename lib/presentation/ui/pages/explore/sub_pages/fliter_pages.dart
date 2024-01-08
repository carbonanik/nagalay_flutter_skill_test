import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  SfRangeValues _values = const SfRangeValues(20.0, 80.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Row(
              children: [
                Icon(Icons.clear),
                SizedBox(width: 20,),
                Text("Filter",

                ),
              ]
            ),
            SfRangeSlider(
              min: 0.0,
              max: 100.0,
              values: _values,
              interval: 20,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              onChanged: (SfRangeValues values) {
                setState(() {
                  _values = values;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
