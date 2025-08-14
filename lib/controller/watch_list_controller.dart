import 'package:flutter/material.dart';
import 'package:movie_catalog_app/models/movie_model.dart';

class WatchListController extends ChangeNotifier {
  List<MovieModel> movieItems = [];

  void addMovieToList(MovieModel item) {
    movieItems.add(item);
    notifyListeners();
  }

  void removeMovieFromList(MovieModel item) {
    movieItems.removeWhere((element) => element.title == item.title);
    notifyListeners();
  }
}
