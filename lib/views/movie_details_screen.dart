import 'package:flutter/material.dart';
import 'package:movie_catalog_app/controller/watch_list_controller.dart';
import 'package:movie_catalog_app/helper/app_colors.dart';
import 'package:movie_catalog_app/models/movie_model.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String title;
  const MovieDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<WatchListController>(
        builder: (context, watchListController, child) {
          var movie = watchListController.getMovieByTitle(title);

          movie ??= MovieModel.getFakeMovies().firstWhere(
            (m) => m.title == title,
            orElse: () => MovieModel.getFakeMovies().first,
          );

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(movie.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Text(
                        "تاريخ الإصدار: ${movie.releaseDate.toLocal().toString().split(' ')[0]}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondry,
                        ),
                      ),
                      const SizedBox(height: 20),

                      Text(
                        movie.desc,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
