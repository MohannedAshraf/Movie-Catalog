import 'package:flutter/material.dart';
import 'package:movie_catalog_app/helper/app_colors.dart';
import 'package:movie_catalog_app/helper/grid_movie.dart';
import 'package:movie_catalog_app/helper/list_movie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Movie Catalog",
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.04,
          right: screenWidth * 0.04,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextFormField(
                decoration: InputDecoration(
                  fillColor: AppColors.search,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    size: screenWidth * 0.06,
                    color: AppColors.primary,
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: AppColors.primary,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.012,
                    horizontal: screenWidth * 0.03,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                  ),
                ),
              ),
              // Special movies
              SizedBox(height: 16),
              InkWell(child: const ListMovie()),
              Text(
                "All Movies",
                style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              SizedBox(height: 16),

              // All movies
              const GridMovie(),
            ],
          ),
        ),
      ),
    );
  }
}
