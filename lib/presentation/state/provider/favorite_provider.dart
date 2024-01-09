import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagalay_flutter_skill_test/presentation/state/notifier/favorite_notifier.dart';

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<String>>((ref) => FavoriteNotifier());
