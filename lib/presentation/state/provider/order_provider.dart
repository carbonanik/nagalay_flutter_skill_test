import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ServiceAdvertisementOrder implements Comparable<ServiceAdvertisementOrder> {
  // relevance(name: "Relevance"),
  newest(name: "Newest"),
  oldest(name: "Oldest");

  final String name;

  const ServiceAdvertisementOrder({required this.name});

  @override
  int compareTo(ServiceAdvertisementOrder other) {
    return name.compareTo(other.name);
  }
}

final serviceAdvertisementOrderProvider =
    StateProvider<ServiceAdvertisementOrder>((ref) => ServiceAdvertisementOrder.newest);
