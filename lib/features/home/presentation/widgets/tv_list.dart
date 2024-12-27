import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:just_movie/core/constants/image_constants.dart';
import 'package:just_movie/core/constants/theme_constants.dart';
import 'package:just_movie/core/services/api_urls.dart';
import 'package:just_movie/core/utils/generic_enums.dart';
import 'package:just_movie/features/home/domain/entities/tv_info.dart';
import 'package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart';
import 'package:just_movie/routes/app_routes.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class TvList extends StatelessWidget {
  const TvList({
    super.key,
    required this.tvList,
    required this.isLoading,
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
                          color: ThemeConstants
                              .clrLightBlueGrey, //ThemeConstants.clrBlack
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
                              print("---------${tv.id}");
                              final movieDetailController =
                                  Get.find<MovieDetailController>();
                              movieDetailController.getTvDetail(
                                tv.id ?? 0,
                              );
                              movieDetailController.getCastDetail(
                                tv.id ?? 0,
                                Credit.tv,
                              );
                              Get.toNamed(AppRoutes.tvDetailRoute);
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 115,
                                  height: 150,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        '${EndPoints.imageBaseUrl200}${tv.posterPath}',
                                    placeholder: (context, url) {
                                      return Shimmer.fromColors(
                                        baseColor:
                                            ThemeConstants.clrLightBlueGrey,
                                        highlightColor:
                                            ThemeConstants.clrBlack100,
                                        child: Container(
                                          width: 115,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:
                                                ThemeConstants.clrLightBlueGrey,
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
                                    tv.name ?? '',
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
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: onRefresh,
                        padding: const EdgeInsets.all(18),
                        style: IconButton.styleFrom(
                          backgroundColor:
                              ThemeConstants.clrLightBlueGrey.withOpacity(0.5),
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
