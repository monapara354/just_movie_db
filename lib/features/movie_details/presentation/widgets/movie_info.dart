import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/constants/image_constants.dart';
import 'package:just_movie/core/constants/string_constants.dart';
import 'package:just_movie/core/constants/theme_constants.dart';
import 'package:just_movie/core/services/api_urls.dart';
import 'package:just_movie/core/shared/domain/methods/methods.dart';
import 'package:just_movie/features/movie_details/domain/entities/cast_crew.dart';
import 'package:just_movie/features/movie_details/domain/entities/movie_detail.dart';
import 'package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart';
import 'package:just_movie/features/movie_details/presentation/widgets/info_row.dart';
import 'package:just_movie/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key, required this.movieInfo, this.castCrew});

  final MovieDetail movieInfo;
  final CastCrew? castCrew;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 12,
            top: 20,
            right: 5,
            bottom: 20,
          ),
          width: double.maxFinite,
          height: 4.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ThemeConstants.clrLightBlueGrey,
                  border: Border.all(
                    color: ThemeConstants.clrBlueGrey,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                margin: const EdgeInsets.only(left: 7, top: 5),
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                child: Text(
                  movieInfo.genres![index].name.toString(),
                  style: const TextStyle(
                    fontSize: 13,
                    color: ThemeConstants.clrWhite,
                  ),
                ),
              );
            },
            itemCount: movieInfo.genres?.length ?? 0,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 12),
              child: Text(
                StringConstants.strMovieInfo,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: ThemeConstants.clrAmberYellow,
                ),
              ),
            ),
            const Flexible(
              child: Divider(
                color: ThemeConstants.clrBlueGrey,
                indent: 10,
                endIndent: 10,
                thickness: 1,
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 12,
          ),
          child: Text(
            StringConstants.strOverview,
            style: TextStyle(
              color: ThemeConstants.clrLightBlue,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 10),
          child: Text(
            movieInfo.overview.toString(),
            style: TextStyle(
              color: ThemeConstants.clrWhite,
              fontSize: 11.sp,
            ),
            overflow: TextOverflow.visible,
          ),
        ),
        InfoRow(
          title: StringConstants.strOriginalTitle,
          value: movieInfo.originalTitle ?? "",
        ),
        InfoRow(
          title: StringConstants.strOriginalLanguage,
          value: movieInfo.originalLanguage ?? "",
        ),
        InfoRow(
          title: StringConstants.strReleaseDate,
          value: dateToFormated(movieInfo.releaseDate.toString()),
        ),
        InfoRow(
          title: StringConstants.strStatus,
          value: movieInfo.status ?? "",
        ),
        InfoRow(
          title: StringConstants.strRevenue,
          value: "\$${formatNumber(movieInfo.revenue ?? 0)}",
        ),
        InfoRow(
          title: StringConstants.strBudget,
          value: "\$${formatNumber(movieInfo.budget ?? 0)}",
        ),
        if (castCrew != null)
          Visibility(
            visible: castCrew?.cast != null && castCrew!.cast!.isNotEmpty,
            replacement: const SizedBox.shrink(),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10, left: 12, bottom: 15),
                  child: const Text(
                    StringConstants.strCast,
                    style: TextStyle(
                      color: Color.fromARGB(255, 131, 175, 195),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: castCrew?.cast?.length ?? 0,
                    itemBuilder: (context, index) {
                      final castList = castCrew?.cast?[index];
                      return GestureDetector(
                        onTap: () {
                          Get.find<MovieDetailController>()
                            ..getPersonDetail(castList.id ?? 0)
                            ..getPersonMovie(castList.id ?? 0);
                          Get.toNamed(AppRoutes.personDetailRoute);
                        },
                        child: Container(
                          width: 95.sp,
                          decoration: BoxDecoration(
                            color: ThemeConstants.clrDarkBlueGrey,
                            border: Border.all(color: ThemeConstants.clrGrey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${EndPoints.imageBaseUrl200}${castList?.profilePath}',
                                  errorWidget: (context, url, error) {
                                    return Image.asset(
                                      ImageConstants.imgUserPlace,
                                      fit: BoxFit.fill,
                                    );
                                  },
                                  fit: BoxFit.fill,
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  castList!.name.toString(),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                castList.character.toString(),
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white60,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
