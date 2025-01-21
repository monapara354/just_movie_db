import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:just_movie/core/constants/theme_constants.dart";
import "package:just_movie/core/utils/generic_enums.dart";
import "package:just_movie/features/home/domain/entities/movie_info.dart";
import "package:just_movie/features/home/presentation/widgets/common_movie_card.dart";
import "package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart";
import "package:just_movie/routes/app_routes.dart";
import "package:shimmer/shimmer.dart";

class MovieList extends StatelessWidget {
  MovieList({
    required this.moviesList, required this.isLoading, super.key,
    this.onRefresh,
  });

  final List<MovieResult> moviesList;
  final bool isLoading;
  final Function()? onRefresh;

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
                          color: ThemeConstants.clrLightBlueGrey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          : moviesList.isNotEmpty
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: moviesList.map(
                      (movie) {
                        return CommonMovieCard(
                          onTap: () {
                            movieDetailController..getMovieDetail(
                              movie.id ?? 0,
                            )
                            ..getCastDetail(
                              movie.id ?? 0,
                              Credit.movie,
                            );
                            Get.toNamed(AppRoutes.movieDetailRoute);
                          },
                          imagePoster: movie.posterPath,
                          name: movie.title,
                        );
                      },
                    ).toList(),
                  ),
                )
              : SizedBox(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: onRefresh,
                        padding: const EdgeInsets.all(18),
                        style: IconButton.styleFrom(
                          backgroundColor:
                              ThemeConstants.clrLightBlueGrey.withValues(alpha: 0.5),
                        ),
                        icon: const Icon(
                          Icons.refresh,
                          color: ThemeConstants.clrAmberYellow,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
