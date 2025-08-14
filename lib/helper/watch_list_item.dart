import 'package:flutter/material.dart';
import 'package:movie_catalog_app/controller/watch_list_controller.dart';
import 'package:movie_catalog_app/helper/app_colors.dart';
import 'package:movie_catalog_app/models/movie_model.dart';
import 'package:provider/provider.dart';

class WatchListItem extends StatelessWidget {
  final MovieModel movieItem;
  const WatchListItem({super.key, required this.movieItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<WatchListController>(
      builder: (context, watchController, child) {
        final isBookmarked = watchController.movieItems.any(
          (element) => element.title == movieItem.title,
        );

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          title: Text(
            movieItem.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          subtitle: Text(
            movieItem.rating.toString(),
            style: TextStyle(color: AppColors.secondry),
          ),
          leading: Image.asset(
            movieItem.image,
            height: 150,
            width: 100,
            fit: BoxFit.cover,
          ),
          trailing: IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_outline_sharp,
              color: isBookmarked ? Colors.yellow : AppColors.primary,
            ),
            onPressed: () {
              watchController.removeMovieFromList(movieItem);
            },
          ),
        );
      },
    );
  }
}
