import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/constants/image_constants.dart';
import 'package:just_movie/core/constants/theme_constants.dart';
import 'package:just_movie/core/services/api_urls.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart';
import 'package:just_movie/routes/app_routes.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class MovieList extends StatelessWidget {
  MovieList({super.key, required this.moviesList, required this.isLoading});

  final List<MovieInfo> moviesList;
  final bool isLoading;

  final movieDetailController = Get.find<MovieDetailController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: isLoading
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) {
                    return Shimmer.fromColors(
                      baseColor: ThemeConstants.clrLightBlueGrey,
                      highlightColor: ThemeConstants.clrBlack100,
                      child: Container(
                        width: 115,
                        height: 170,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ThemeConstants
                              .clrLightBlueGrey, //ThemeConstants.clrBlack
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: moviesList.map(
                  (movie) {
                    return Container(
                      width: 115,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeConstants
                            .clrLightBlueGrey, //ThemeConstants.clrBlack
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: GestureDetector(
                        onTap: () {
                          movieDetailController.getMovieDetail(
                            movie.id ?? 0,
                          );
                          movieDetailController.getCastDetail(
                            movie.id ?? 0,
                          );
                          Get.toNamed(AppRoutes.movieDetailRoute);
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              width: 115,
                              height: 150,
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${EndPoints.imageBaseUrl200}${movie.posterPath}',
                                placeholder: (context, url) {
                                  return Shimmer.fromColors(
                                    baseColor: ThemeConstants.clrLightBlueGrey,
                                    highlightColor: ThemeConstants.clrBlack100,
                                    child: Container(
                                      width: 115,
                                      height: 150,
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
                                width: 115,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                                left: 2,
                                right: 2,
                              ),
                              child: Text(
                                movie.title ?? '',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: ThemeConstants.clrWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
    );
  }
}
