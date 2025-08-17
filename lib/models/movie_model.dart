import 'package:movie_catalog_app/helper/app_images.dart';

class MovieModel {
  final String title;
  final String desc;
  final double rating;
  final DateTime releaseDate;
  final String image;
  final bool isBookmarked;
  final bool isFeatured;

  MovieModel({
    required this.title,
    required this.desc,
    required this.rating,
    required this.releaseDate,
    required this.image,
    required this.isBookmarked,
    required this.isFeatured,
  });
  // same data at run
  static final List<MovieModel> _movies = _generateMovies();

  static List<MovieModel> getFakeMovies() => _movies;

  static List<MovieModel> _generateMovies() {
    final List<MovieModel> movies = [];

    final List<String> bookTitles = [
      "The Last Journey",
      "Silent Echo",
      "Eternal Shadows",
      "Beyond the Horizon",
      "Midnight Chronicles",
      "The Hidden Truth",
      "Lost in Time",
      "Broken Memories",
      "The Final Hour",
      "Whispers in the Dark",
      "Rising Storm",

      "Spider Man 1",
      "Spider Man 2",
      "Spider Man 3",
      "Spider Man 4",
      "Spider Man 5",
      "Fast 1",
      "Fast 2",
      "Fast 3",
      "Fast 4",
    ];

    final List<String> descriptions = [
      "A thrilling adventure that will keep you on the edge of your seat.",
      "An emotional journey through time and space that challenges perceptions.",
      "When darkness falls, the real story begins. A tale of courage and redemption.",
      "Sometimes the truth is hidden in plain sight. A mystery that unfolds slowly.",
      "Against all odds, heroes rise. An epic story of survival and hope.",
    ];

    final List<String> images = [
      AppImages.book,
      AppImages.book1,
      AppImages.book2,
      AppImages.book3,
      AppImages.book4,
      AppImages.book5,
    ];

    for (int i = 0; i < 100; i++) {
      final int titleIndex = i % bookTitles.length;
      final int descIndex = i % descriptions.length;
      final int imageIndex = i % images.length;

      final String title = "${bookTitles[titleIndex]} ${i + 1}";
      final String desc = descriptions[descIndex];
      final double rating = 7.5 + (i % 25) / 10;

      final DateTime releaseDate = DateTime(2020, 1 + (i % 12), 1 + (i % 28));
      final String image = images[imageIndex];
      final bool isBookmarked = false;
      final bool isFeatured = i % 5 == 0;

      movies.add(
        MovieModel(
          title: title,
          desc: desc,
          rating: rating,
          releaseDate: releaseDate,
          image: image,
          isBookmarked: isBookmarked,
          isFeatured: isFeatured,
        ),
      );
    }

    return movies;
  }
}
