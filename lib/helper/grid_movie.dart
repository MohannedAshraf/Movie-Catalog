import 'package:flutter/material.dart';
import 'package:movie_catalog_app/controller/watch_list_controller.dart';
import 'package:movie_catalog_app/helper/app_colors.dart';
import 'package:movie_catalog_app/models/movie_model.dart';
import 'package:provider/provider.dart';

class GridMovie extends StatelessWidget {
  const GridMovie({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = MovieModel.getFakeMovies();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final itemWidth = (screenWidth / 2) - 20;
    final itemHeight = screenHeight * 0.3;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        final watchList = context.watch<WatchListController>();
        final isBookmarked = watchList.movieItems.any(
          (item) => item.title == movie.title,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    movie.image,
                    width: itemWidth,
                    height: itemHeight,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      isBookmarked
                          ? Icons.bookmark
                          : Icons.bookmark_outline_sharp,
                      color: isBookmarked ? Colors.yellow : AppColors.search,
                    ),
                    onPressed: () {
                      if (isBookmarked) {
                        context.read<WatchListController>().removeMovieFromList(
                          movie,
                        );
                      } else {
                        context.read<WatchListController>().addMovieToList(
                          movie,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              movie.title,
              style: TextStyle(fontSize: 16, color: AppColors.primary),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      },
    );
  }
}
