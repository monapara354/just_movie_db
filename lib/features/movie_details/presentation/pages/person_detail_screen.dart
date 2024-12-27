import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/constants/image_constants.dart';
import 'package:just_movie/core/constants/string_constants.dart';
import 'package:just_movie/core/constants/theme_constants.dart';
import 'package:just_movie/core/services/api_urls.dart';
import 'package:just_movie/features/home/presentation/widgets/movie_list.dart';
import 'package:just_movie/features/home/presentation/widgets/tv_list.dart';
import 'package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart';
import 'package:shimmer/shimmer.dart';

class PersonDetailScreen extends StatelessWidget {
  PersonDetailScreen({super.key});

  final movieDetailController = Get.find<MovieDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ThemeConstants.clrWhite,
        centerTitle: true,
        title: Obx(() {
          return Text(movieDetailController.personData.value?.name ?? "");
        }),
        elevation: 2,
      ),
      body: Obx(() {
        final personData = movieDetailController.personData.value;
        return Visibility(
          visible: personData != null,
          replacement: !movieDetailController.isPersonLoading.value
              ? const Center(
                  child: Text('No data found'),
                )
              : const Center(child: CircularProgressIndicator()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 15, bottom: 10),
                      clipBehavior: Clip.hardEdge,
                      child: CachedNetworkImage(
                        imageUrl:
                            "${EndPoints.imageBaseUrl300}${personData?.profilePath}",
                        placeholder: (context, url) {
                          return Shimmer.fromColors(
                            baseColor: ThemeConstants.clrLightBlueGrey,
                            highlightColor: ThemeConstants.clrBlack100,
                            child: Container(
                              width: 120,
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ThemeConstants.clrLightBlueGrey,
                              ),
                            ),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return Image.asset(
                            ImageConstants.imgUserPlace,
                            fit: BoxFit.cover,
                          );
                        },
                        fit: BoxFit.fill,
                        width: 120,
                        height: 170,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    personData?.name ?? "",
                    style: const TextStyle(
                      fontSize: 20,
                      color: ThemeConstants.clrAmberYellow,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    personData?.knownForDepartment ?? "",
                    style: const TextStyle(
                      fontSize: 14,
                      color: ThemeConstants.clrWhite,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 24, bottom: 12),
                  child: const Text(
                    StringConstants.strMovies,
                    style: TextStyle(
                      color: ThemeConstants.clrYellow,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                MovieList(
                  moviesList: movieDetailController.movieList,
                  isLoading: movieDetailController.isMovieLoading.value,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 24, bottom: 12),
                  child: const Text(
                    StringConstants.strTvShows,
                    style: TextStyle(
                      color: ThemeConstants.clrYellow,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                TvList(
                  tvList: movieDetailController.tvList,
                  isLoading: movieDetailController.isTvLoading.value,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
