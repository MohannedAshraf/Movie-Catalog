import 'package:flutter/material.dart';
import 'package:movie_catalog_app/helper/app_colors.dart';
import 'package:movie_catalog_app/models/movie_model.dart';
import 'package:movie_catalog_app/views/movie_details_screen.dart';

class ListMovie extends StatelessWidget {
  const ListMovie({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = MovieModel.getFakeMovies();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final itemWidth = screenWidth * 0.6;
    final itemHeight = screenHeight * 0.45;

    return SizedBox(
      height: itemHeight + 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => MovieDetailsScreen(title: movie.title),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    movie.image,
                    width: itemWidth,
                    height: itemHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                movie.title,
                style: TextStyle(fontSize: 16, color: AppColors.primary),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: movies.length,
      ),
    );
  }
}
