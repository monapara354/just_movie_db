import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart";
import "package:just_movie/features/search/presentation/controller/search_controller.dart";
import "package:just_movie/features/search/presentation/widgets/search_item_view.dart";
import "package:just_movie/routes/app_routes.dart";

class PersonTab extends StatelessWidget {
  const PersonTab({required this.searchXController, super.key});

  final SearchXController searchXController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: !searchXController.isPersonLoading.value,
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
          itemCount: searchXController.searchPersonList.length,
          itemBuilder: (context, index) {
            final person = searchXController.searchPersonList[index];
            return GestureDetector(
              onTap: () {
                Get.find<MovieDetailController>()
                  ..getPersonDetail(person.id ?? 0)
                  ..getPersonMovie(person.id ?? 0)
                  ..getPersonTvShow(person.id ?? 0);
                Get.toNamed(AppRoutes.personDetailRoute);
              },
              child: SearchItemView(
                posterImage: person.profilePath ?? "",
                name: person.name ?? "",
              ),
            );
          },
        ),
      );
    });
  }
}
