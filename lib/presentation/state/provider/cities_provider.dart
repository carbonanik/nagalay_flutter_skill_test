import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/notifier/cities_notifier.dart';

final citiesProvider = ChangeNotifierProvider<CitiesNotifier>((ref) => CitiesNotifier(ref: ref));
