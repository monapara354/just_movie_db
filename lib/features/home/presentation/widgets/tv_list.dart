import "package:flutter/material.dart";
import "package:get/get.dart";

import "package:just_movie/core/constants/theme_constants.dart";
import "package:just_movie/core/utils/generic_enums.dart";
import "package:just_movie/features/home/domain/entities/tv_info.dart";
import "package:just_movie/features/home/presentation/widgets/common_movie_card.dart";
import "package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart";
import "package:just_movie/routes/app_routes.dart";
import "package:shimmer/shimmer.dart";

class TvList extends StatelessWidget {
  const TvList({
    required this.tvList, required this.isLoading, super.key,
    this.onRefresh,
  });

  final List<TvResult> tvList;
  final bool isLoading;
  final Function()? onRefresh;

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
          : tvList.isNotEmpty
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: tvList.map(
                      (tv) {
                        return CommonMovieCard(
                          onTap: () {
                            Get.find<MovieDetailController>()
                              ..getTvDetail(
                                tv.id ?? 0,
                              )
                              ..getCastDetail(
                                tv.id ?? 0,
                                Credit.tv,
                              );
                            Get.toNamed(AppRoutes.tvDetailRoute);
                          },
                          imagePoster: tv.posterPath,
                          name: tv.name,
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
