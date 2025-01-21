import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:just_movie/core/constants/string_constants.dart";
import "package:just_movie/core/constants/theme_constants.dart";
import "package:just_movie/core/services/api_urls.dart";
import "package:just_movie/features/movie_details/domain/entities/cast_crew.dart";
import "package:just_movie/features/movie_details/domain/entities/tv_detail.dart";
import "package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart";
import "package:just_movie/features/movie_details/presentation/widgets/cast_widget.dart";
import "package:just_movie/features/movie_details/presentation/widgets/common_container.dart";
import "package:just_movie/features/movie_details/presentation/widgets/info_row.dart";
import "package:just_movie/routes/app_routes.dart";
import "package:sizer/sizer.dart";

class TvInfoWidget extends StatelessWidget {
  const TvInfoWidget({
    required this.tvInfo, required this.castCrew, super.key,
  });

  final TvDetail tvInfo;
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
            bottom: 8,
          ),
          width: double.maxFinite,
          height: 4.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CommonContainer(
                name: tvInfo.genres![index].name.toString(),
              );
            },
            itemCount: tvInfo.genres?.length ?? 0,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 10, left: 18),
          child: const Text(
            StringConstants.strNetworks,
            style: TextStyle(
                color: Color.fromARGB(255, 131, 175, 195),
                fontWeight: FontWeight.w500,
                fontSize: 15,),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 12,
            top: 5,
            right: 5,
            bottom: 20,
          ),
          width: double.maxFinite,
          height: 4.5.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                width: 70,
                decoration: BoxDecoration(
                  color: ThemeConstants.clrWhite,
                  border: Border.all(
                    color: ThemeConstants.clrBlueGrey,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                margin: const EdgeInsets.only(left: 7, top: 5),
                padding: const EdgeInsets.all(5),
                child: CachedNetworkImage(
                  imageUrl:
                      "${EndPoints.imageBaseUrl200}${tvInfo.networks![index].logoPath}",
                  fit: BoxFit.fill,
                ),
              );
            },
            itemCount: tvInfo.networks?.length ?? 0,
          ),
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 12),
              child: Text(
                StringConstants.strTvInfo,
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
            tvInfo.overview.toString(),
            style: TextStyle(
              color: ThemeConstants.clrWhite,
              fontSize: 11.sp,
            ),
            overflow: TextOverflow.visible,
          ),
        ),
        InfoRow(
          title: StringConstants.strOriginalTitle,
          value: tvInfo.originalName ?? "",
        ),
        InfoRow(
          title: StringConstants.strOriginalLanguage,
          value: tvInfo.originalLanguage ?? "",
        ),
        InfoRow(
          title: StringConstants.strStatus,
          value: tvInfo.status ?? "",
        ),
        InfoRow(
          title: StringConstants.strTotalEpisodes,
          value: tvInfo.numberOfEpisodes.toString(),
        ),
        InfoRow(
            title: StringConstants.strSeasons,
            value: tvInfo.numberOfSeasons.toString(),),
        if (castCrew != null)
          Visibility(
            visible: castCrew?.cast != null && castCrew!.cast!.isNotEmpty,
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

                      return CastWidget(
                        onTap: () {
                          Get.find<MovieDetailController>()
                            ..getPersonDetail(castList.id ?? 0)
                            ..getPersonMovie(castList.id ?? 0)
                            ..getPersonTvShow(castList.id ?? 0);
                          Get.toNamed(AppRoutes.personDetailRoute);
                        },
                        profilePath: castList?.profilePath ?? "",
                        name: castList!.name.toString(),
                        characterName: castList.character.toString(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
