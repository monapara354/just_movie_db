import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/constants/image_constants.dart';
import 'package:just_movie/core/constants/string_constants.dart';
import 'package:just_movie/core/constants/theme_constants.dart';
import 'package:just_movie/core/services/api_urls.dart';
import 'package:just_movie/core/utils/generic_enums.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart';
import 'package:just_movie/routes/app_routes.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CustomSliderMovie extends StatelessWidget {
  const CustomSliderMovie({
    super.key,
    required this.moviesList,
    required this.isLoading,
  });

  final List<MovieInfo> moviesList;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 180.sp,
          aspectRatio: 16 / 9,
          viewportFraction: 0.9,
          autoPlay: true,
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(seconds: 6),
        ),
        items: isLoading
            ? [
                Shimmer.fromColors(
                  baseColor: ThemeConstants.clrLightBlueGrey,
                  highlightColor: ThemeConstants.clrBlack100,
                  child: Container(
                    width: double.maxFinite,
                    height: 180.sp,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ThemeConstants.clrLightBlueGrey,
                    ),
                  ),
                )
              ]
            : moviesList.isNotEmpty
                ? moviesList.map(
                    (movie) {
                      return GestureDetector(
                        onTap: () {
                          Get.find<MovieDetailController>()
                            ..getMovieDetail(
                              movie.id ?? 0,
                            )
                            ..getCastDetail(
                              movie.id ?? 0,
                              Credit.movie,
                            );
                          Get.toNamed(AppRoutes.movieDetailRoute);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          clipBehavior: Clip.hardEdge,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: ThemeConstants.clrBlue,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${EndPoints.imageBaseUrl500}${movie.posterPath}',
                            placeholder: (context, url) {
                              return Shimmer.fromColors(
                                baseColor: ThemeConstants.clrLightBlueGrey,
                                highlightColor: ThemeConstants.clrBlack100,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ThemeConstants.clrLightBlueGrey,
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
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ).toList()
                : [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info,
                          color: ThemeConstants.clrBlueGrey,
                          size: 30,
                        ),
                        SizedBox(height: 10),
                        Text(
                          StringConstants.strSomethingWrong,
                          style: TextStyle(
                            color: ThemeConstants.clrWhite,
                          ),
                        ),
                      ],
                    )
                  ],
      ),
    );
  }
}
