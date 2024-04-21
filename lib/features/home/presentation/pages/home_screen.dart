import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/constants/string_constants.dart';
import 'package:just_movie/core/constants/theme_constants.dart';
import 'package:just_movie/features/home/presentation/controller/home_controller.dart';
import 'package:just_movie/features/home/presentation/widgets/movie_list.dart';
import 'package:just_movie/features/home/presentation/widgets/title_text.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: ThemeConstants.clrLightBlueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          StringConstants.strAppName,
        ),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                TitleText(
                  title: StringConstants.strNowPlaying,
                  isLoading: homeController.isLoading.value,
                ),
                MovieList(
                  moviesList: homeController.nowPlayingMovieList,
                  isLoading: homeController.isLoading.value,
                ),
                TitleText(
                  title: StringConstants.strUpcoming,
                  isLoading: homeController.isLoading.value,
                ),
                MovieList(
                  moviesList: homeController.upcomingMovieList,
                  isLoading: homeController.isLoading.value,
                ),
                TitleText(
                  title: StringConstants.strPopular,
                  isLoading: homeController.isLoading.value,
                ),
                MovieList(
                  moviesList: homeController.popularMovieList,
                  isLoading: homeController.isLoading.value,
                ),
                TitleText(
                  title: StringConstants.strTopRated,
                  isLoading: homeController.isLoading.value,
                ),
                MovieList(
                  moviesList: homeController.topRatedMovieList,
                  isLoading: homeController.isLoading.value,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
