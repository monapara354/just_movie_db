import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:just_movie/core/utils/generic_enums.dart";
import "package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart";
import "package:just_movie/features/search/presentation/controller/search_controller.dart";
import "package:just_movie/features/search/presentation/widgets/search_item_view.dart";
import "package:just_movie/routes/app_routes.dart";

class TvshowTab extends StatelessWidget {
  const TvshowTab({required this.searchXController, super.key});

  final SearchXController searchXController;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: !searchXController.isTvShowLoading.value,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 20,
            mainAxisExtent: 200,
          ),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: searchXController.searchTvList.length,
          itemBuilder: (context, index) {
            final tvShow = searchXController.searchTvList[index];
            return GestureDetector(
              onTap: () {
                Get.find<MovieDetailController>()
                  ..getTvDetail(
                    tvShow.id ?? 0,
                  )
                  ..getCastDetail(
                    tvShow.id ?? 0,
                    Credit.tv,
                  );
                Get.toNamed(AppRoutes.tvDetailRoute);
              },
              child: SearchItemView(
                posterImage: tvShow.posterPath ?? "",
                name: tvShow.name ?? "",
              ),
            );
          },
        ),
      );
    });
  }
}
