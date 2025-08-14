import 'package:flutter/material.dart';
import 'package:movie_catalog_app/controller/watch_list_controller.dart';
import 'package:movie_catalog_app/helper/app_colors.dart';
import 'package:movie_catalog_app/helper/watch_list_item.dart';
import 'package:provider/provider.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: const [
          SizedBox(width: 20),
          Icon(Icons.search, color: AppColors.primary),
        ],
        title: const Text(
          "Watchlist",
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<WatchListController>(
        builder: (context, watchController, child) {
          if (watchController.movieItems.isEmpty) {
            return const Center(
              child: Text(
                "No movies in Watchlist",
                style: TextStyle(color: AppColors.primary, fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: watchController.movieItems.length,
            itemBuilder: (context, index) {
              final movie = watchController.movieItems[index];
              return InkWell(child: WatchListItem(movieItem: movie));
            },
          );
        },
      ),
    );
  }
}
