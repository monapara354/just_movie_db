import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:just_movie/core/constants/string_constants.dart";
import "package:just_movie/core/constants/theme_constants.dart";
import "package:just_movie/features/home/presentation/controller/home_controller.dart";
import "package:just_movie/routes/app_routes.dart";
import "package:shimmer/shimmer.dart";
import "package:sizer/sizer.dart";

class TitleText extends StatelessWidget {
  const TitleText({
    required this.title, required this.isLoading, super.key,
    this.isTvShow = false,
  });
  final String title;
  final bool isLoading;
  final bool isTvShow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: isLoading
          ? Shimmer.fromColors(
              baseColor: ThemeConstants.clrLightBlueGrey,
              highlightColor: ThemeConstants.clrBlack100,
              child: Container(
                width: 35.w,
                height: 8.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ThemeConstants.clrBlack100,
                ),
              ),
            )
          : Row(
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: ThemeConstants.clrWhite,
                      ),
                    ),
                    if (isTvShow)
                      const Text(
                        StringConstants.strTvShows,
                        style: TextStyle(
                          fontSize: 13,
                          color: ThemeConstants.clrGrey,
                        ),
                      ).marginOnly(left: 10),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Get.find<HomeController>()
                      ..movieCurrentPage = 1
                      ..getMoreMovie();
                    Get.toNamed(AppRoutes.moreMovieRoute);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_right,
                  ),
                ),
              ],
            ),
    );
  }
}
