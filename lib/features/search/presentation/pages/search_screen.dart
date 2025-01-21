import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:just_movie/core/constants/string_constants.dart";
import "package:just_movie/core/constants/theme_constants.dart";
import "package:just_movie/features/search/presentation/controller/search_controller.dart";
import "package:just_movie/features/search/presentation/pages/tabs/movie_tab.dart";
import "package:just_movie/features/search/presentation/pages/tabs/person_tab.dart";
import "package:just_movie/features/search/presentation/pages/tabs/tvshow_tab.dart";

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final searchController = Get.find<SearchXController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ThemeConstants.clrWhite,
        title: TextField(
          controller: searchController.searchTextController,
          onChanged: (value) {
            if (value.isNotEmpty) {
              switch (searchController.tabController.index) {
                case 0:
                  searchController.getSearchMovie();
                  break;
                case 1:
                  searchController.getSearchTvShow();
                  break;
                case 2:
                  searchController.getSearchPerson();
                  break;
              }
            } else {
              searchController.searchMovieList.clear();
              searchController.searchPersonList.clear();
              searchController.searchTvList.clear();
            }
          },
          style: const TextStyle(color: ThemeConstants.clrWhite),
          decoration: const InputDecoration(
            hintText: StringConstants.strSearchHint,
            hintStyle: TextStyle(color: ThemeConstants.clrGrey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ThemeConstants.clrLightBlueGrey,
              ),
            ),
            border: UnderlineInputBorder(),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ThemeConstants.clrBlueGrey,
              ),
            ),
          ),
        ),
        elevation: 2,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: TabBar(
            controller: searchController.tabController,
            indicatorColor: ThemeConstants.clrAmberYellow,
            dividerColor: ThemeConstants.clrBlueGrey,
            labelColor: ThemeConstants.clrWhite,
            unselectedLabelColor: ThemeConstants.clrLightBlue.withValues(alpha: 0.5),
            splashFactory: NoSplash.splashFactory,
            splashBorderRadius: BorderRadius.circular(10),
            tabs: searchController.myTabs,
            onTap: (value) {
              if (searchController.searchTextController.text.isNotEmpty) {
                switch (value) {
                  case 0:
                    searchController.getSearchMovie();
                    break;
                  case 1:
                    searchController.getSearchTvShow();
                    break;
                  case 2:
                    searchController.getSearchPerson();
                    break;
                }
              }
            },
          ),
        ),
      ),
      body: TabBarView(
        controller: searchController.tabController,
        children: [
          MovieTab(searchXController: searchController),
          TvshowTab(searchXController: searchController),
          PersonTab(searchXController: searchController),
        ],
      ),
    );
  }
}
