import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:just_movie/core/constants/string_constants.dart";
import "package:just_movie/core/constants/theme_constants.dart";
import "package:just_movie/features/home/presentation/controller/home_controller.dart";
import "package:just_movie/features/home/presentation/widgets/custom_slider_movie.dart";
import "package:just_movie/features/home/presentation/widgets/movie_list.dart";
import "package:just_movie/features/home/presentation/widgets/title_text.dart";
import "package:just_movie/features/home/presentation/widgets/tv_list.dart";
import "package:just_movie/routes/app_routes.dart";

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ThemeConstants.clrLightBlueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(StringConstants.strAppName),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.searchRoute);
            },
            icon: const Icon(
              Icons.search,
              color: ThemeConstants.clrWhite,
            ),
          ),
        ],
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                CustomSliderMovie(
                  moviesList: homeController.upcomingMovieList,
                  isLoading: homeController.isLoading.value,
                ),
                TitleText(
                  title: StringConstants.strNowPlaying,
                  isLoading: homeController.isLoading.value,
                ),
                MovieList(
                  moviesList: homeController.nowPlayingMovieList,
                  isLoading: homeController.isLoading.value,
                  onRefresh: () {
                    homeController.getNowPlayingMovie();
                  },
                ),
                /*  TitleText(
                  title: StringConstants.strUpcoming,
                  isLoading: homeController.isLoading.value,
                ),
                MovieList(
                  moviesList: homeController.upcomingMovieList,
                  isLoading: homeController.isLoading.value,
                  onRefresh: () {
                    homeController.getUpcomingMovie();
                  },
                ),  */
                TitleText(
                  title: StringConstants.strPopular,
                  isLoading: homeController.isLoading.value,
                ),
                MovieList(
                  moviesList: homeController.popularMovieList,
                  isLoading: homeController.isLoading.value,
                  onRefresh: () {
                    homeController.getPopularMovie();
                  },
                ),
                TitleText(
                  title: StringConstants.strTopRated,
                  isLoading: homeController.isLoading.value,
                ),
                MovieList(
                  moviesList: homeController.topRatedMovieList,
                  isLoading: homeController.isLoading.value,
                  onRefresh: () {
                    homeController.getTopRatedMovie();
                  },
                ),
                Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        title: StringConstants.strTrending,
                        isLoading: homeController.isTvLoading.value,
                        isTvShow: true,
                      ),
                      TvList(
                        tvList: homeController.trendingTvList,
                        isLoading: homeController.isTvLoading.value,
                        onRefresh: () {
                          homeController.getTrendingTvShow();
                        },
                      ),
                      TitleText(
                        title: StringConstants.strNetflix,
                        isLoading: homeController.isTvLoading.value,
                        isTvShow: true,
                      ),
                      TvList(
                        tvList: homeController.netflixTvList,
                        isLoading: homeController.isTvLoading.value,
                        onRefresh: () {
                          homeController.getNetflixTvShow();
                        },
                      ),
                      TitleText(
                        title: StringConstants.strDisney,
                        isLoading: homeController.isTvLoading.value,
                        isTvShow: true,
                      ),
                      TvList(
                        tvList: homeController.disneyTvList,
                        isLoading: homeController.isTvLoading.value,
                        onRefresh: () {
                          homeController.getDisneyTvShow();
                        },
                      ),
                      TitleText(
                        title: StringConstants.strAmazon,
                        isLoading: homeController.isTvLoading.value,
                        isTvShow: true,
                      ),
                      TvList(
                        tvList: homeController.amazonTvList,
                        isLoading: homeController.isTvLoading.value,
                        onRefresh: () {
                          homeController.getAmazonTvShow();
                        },
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 15),
              ],
            ),
          );
        }),
      ),
    );
  }
}
