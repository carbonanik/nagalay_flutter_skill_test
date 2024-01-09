import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends StateNotifier<List<String>> {
  FavoriteNotifier() : super([]);

  void addFavorite(String favorite) {
    state = [...state, favorite];
  }

  void removeFavorite(String favorite) {
    state = state.where((element) => element != favorite).toList();
  }

  void toggleFavorite(String favorite) {
    if (state.contains(favorite)) {
      removeFavorite(favorite);
    } else {
      addFavorite(favorite);
    }
  }
}
