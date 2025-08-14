import 'package:flutter/material.dart';
import 'package:movie_catalog_app/controller/watch_list_controller.dart';
import 'package:movie_catalog_app/helper/app_colors.dart';
import 'package:movie_catalog_app/views/navigation_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WatchListController(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: AppBarTheme(backgroundColor: AppColors.background),
        ),
        debugShowCheckedModeBanner: false,
        home: MainNavigation(),
      ),
    );
  }
}
