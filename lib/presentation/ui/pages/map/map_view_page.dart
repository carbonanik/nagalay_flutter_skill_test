import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:nagalay_flutter_skill_test/data/model/generated_models_for_advertisements.dart';
import 'package:nagalay_flutter_skill_test/gen/assets.gen.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/map_selected_advertisement_id_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/provider/service_advertisement_provider.dart';
import 'package:nagalay_flutter_skill_test/presentation/theme/colors.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/components/my_svg.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/local_component/item_view.dart';
import 'package:nagalay_flutter_skill_test/presentation/ui/pages/explore/sub_pages/selection_page.dart';

class MapViewPage extends StatefulWidget {
  const MapViewPage({super.key});

  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _buildMap(),
            _buildSelectedAdvertisement(),
            _buildFloatingTopSearchButton(context),
            _buildFloatingBack(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingBack(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.only(left: 14, top: 10, bottom: 10, right: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: textColor500.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              )
            ],
          ),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 14,
            color: textColor500,
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingTopSearchButton(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      right: 20,
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SelectionPage(),
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MySvg(
                    Assets.icons.search,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Search Again',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  FlutterMap _buildMap() {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(23.8041, 90.4152),
        initialZoom: 11.49,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        Consumer(
          builder: (context, ref, child) {
            final advertisement = ref.watch(serviceAdvertisementProvider);
            final selectedAdvertisementId = ref.watch(mapSelectedAdvertisementIdProvider);
            return MarkerLayer(
              markers: advertisement.advertisement
                  .map(
                    (advertisement) => _buildMarker(
                      advertisement,
                      ref,
                      selectedAdvertisementId,
                    ),
                  )
                  .toList(),
            );
          },
        )
      ],
    );
  }

  Marker _buildMarker(Advertisement advertisement, WidgetRef ref, Object? selectedAdvertisementId) {
    return Marker(
      width: (advertisement.price?.hourly?.toString().length ?? 5) * 18 + 4,
      height: 28,
      point: LatLng(
        advertisement.address?.location?.latitude ?? 0,
        advertisement.address?.location?.longitude ?? 0,
      ),
      child: GestureDetector(
        onTap: () {
          ref.read(mapSelectedAdvertisementIdProvider.notifier).updateSelectedAdvertisementId(advertisement.id);
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: selectedAdvertisementId == advertisement.id
                ? Theme.of(context).colorScheme.inversePrimary
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: selectedAdvertisementId == advertisement.id
                ? null
                : Border.all(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    width: 2,
                  ),
          ),
          child: Center(
            child: Text(
              '\$${advertisement.price?.hourly}/h',
              style: TextStyle(
                color: selectedAdvertisementId == advertisement.id ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedAdvertisement() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Consumer(
        builder: (context, ref, child) {
          final id = ref.watch(mapSelectedAdvertisementIdProvider);
          final advertisement = ref.watch(mapSelectedAdvertisementIdProvider.notifier);
          if (id == null) {
            return Container();
          }
          return Container(
            padding: const EdgeInsets.all(16),
            child: ItemView(
              advertisement: advertisement.getSelectedAdvertisement()!,
              deepShadow: true,
            ),
          );
        },
      ),
    );
  }
}
