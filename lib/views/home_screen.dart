import 'package:flutter/material.dart';
import 'package:movie_catalog_app/controller/watch_list_controller.dart';
import 'package:movie_catalog_app/helper/app_colors.dart';
import 'package:movie_catalog_app/helper/grid_movie.dart';
import 'package:movie_catalog_app/helper/list_movie.dart';
import 'package:movie_catalog_app/views/movie_details_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = "";

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
              //  Search bar
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: screenWidth * 0.042,
                ),
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
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              //  Search Results
              if (query.isNotEmpty)
                Consumer<WatchListController>(
                  builder: (context, controller, child) {
                    final results = controller.search(query);
                    return Column(
                      children:
                          results.map((movie) {
                            return ListTile(
                              title: Text(
                                movie.title,
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) => MovieDetailsScreen(
                                          title: movie.title,
                                        ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                    );
                  },
                ),

              const SizedBox(height: 16),

              //  Special movies
              InkWell(child: const ListMovie()),

              Text(
                "All Movies",
                style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 16),

              //  All movies
              const GridMovie(),
            ],
          ),
        ),
      ),
    );
  }
}
