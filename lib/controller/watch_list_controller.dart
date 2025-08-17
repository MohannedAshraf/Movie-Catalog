import 'package:flutter/material.dart';
import 'package:movie_catalog_app/models/movie_model.dart';

class WatchListController extends ChangeNotifier {
  List<MovieModel> movieItems = [];
  //add movie
  void addMovieToList(MovieModel item) {
    movieItems.add(item);
    notifyListeners();
  }

  // remove movie
  void removeMovieFromList(MovieModel item) {
    movieItems.removeWhere((element) => element.title == item.title);
    notifyListeners();
  }

  //get specific movie
  MovieModel? getMovieByTitle(String title) {
    try {
      return movieItems.firstWhere((element) => element.title == title);
    } catch (e) {
      return null;
    }
  }

  // search movie
  List<MovieModel> search(String query) {
    if (query.isEmpty) return [];

    final allMovies = [...movieItems, ...MovieModel.getFakeMovies()];

    return allMovies
        .where(
          (movie) => movie.title.toLowerCase().contains(query.toLowerCase()),
        )
        .take(5)
        .toList();
  }
}
