import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/constants/image_constants.dart';
import 'package:just_movie/core/constants/theme_constants.dart';
import 'package:just_movie/core/services/api_urls.dart';
import 'package:just_movie/core/shared/domain/methods/methods.dart';
import 'package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart';
import 'package:just_movie/features/movie_details/presentation/widgets/movie_info.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieDetailScreen({super.key});

  final movieDetailController = Get.find<MovieDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final movieInfo = movieDetailController.movieInfo.value;
        final castCrew = movieDetailController.castCrew.value;
        return Visibility(
            visible: movieInfo != null,
            replacement: !movieDetailController.isInfoLoading.value
                ? const Center(
                    child: Text('No data found'),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      '${EndPoints.imageBaseUrl500}${movieInfo?.backdropPath}',
                  placeholder: (context, url) {
                    return Center(
                        child: Container(
                      color: ThemeConstants.clrBlack100,
                    ));
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      width: double.maxFinite,
                      height: 120,
                      color: ThemeConstants.clrLightBlueGrey.withOpacity(0.5),
                      child: const Icon(
                        Icons.local_movies_outlined,
                        size: 60,
                        color: ThemeConstants.clrGrey,
                      ),
                    );
                  },
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
                Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 180,
                              left: 12,
                              right: 15,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 5,
                                        spreadRadius: 0.8,
                                        color: ThemeConstants.clrBlueGrey,
                                      )
                                    ],
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        '${EndPoints.imageBaseUrl300}${movieInfo?.posterPath}',
                                    // width: 35.w,
                                    // height: 25.h,
                                    width: 95.sp,
                                    height: 130.sp,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) {
                                      return Shimmer.fromColors(
                                        baseColor:
                                            ThemeConstants.clrLightBlueGrey,
                                        highlightColor:
                                            ThemeConstants.clrBlack100,
                                        child: Container(
                                          width: 95.sp,
                                          height: 125.sp,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: ThemeConstants
                                                .clrLightBlueGrey, //ThemeConstants.clrBlack
                                          ),
                                        ),
                                      );
                                    },
                                    errorWidget: (context, url, error) {
                                      return Image.asset(
                                        ImageConstants.imgPosterPlace,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    bottom: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 50.w,
                                        child: Text(
                                          movieInfo?.title ?? "",
                                          style: TextStyle(
                                            fontSize: 19.sp,
                                            color: ThemeConstants.clrWhite,
                                          ),
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          durationToString(
                                              movieInfo?.runtime ?? 0),
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: ThemeConstants.clrWhite,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              IconsConstants.icTMDB,
                                              width: 10.w,
                                              height: 7.h,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 8),
                                              alignment: Alignment.center,
                                              child: Text(
                                                movieInfo?.voteAverage
                                                        .toString() ??
                                                    "",
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: ThemeConstants
                                                      .clrAmberYellow,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (movieInfo != null)
                            MovieInfo(
                              movieInfo: movieInfo,
                              castCrew: castCrew,
                            ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 10,
                        ),
                        child: IconButton(
                          color: ThemeConstants.clrAmberYellow,
                          style: IconButton.styleFrom(
                            backgroundColor: ThemeConstants.clrDarkBlueGrey,
                          ),
                          iconSize: 28,
                          onPressed: Get.back,
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ));
      }),
    );
  }
}
