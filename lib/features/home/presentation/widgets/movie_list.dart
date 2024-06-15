import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/constants/theme_constants.dart';
import 'package:just_movie/features/home/domain/entities/movie_info.dart';
import 'package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart';
import 'package:just_movie/routes/app_routes.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class MovieList extends StatelessWidget {
   MovieList(
      {super.key, required this.moviesList, required this.isLoading});

  final List<MovieInfo> moviesList;
  final bool isLoading;

  final movieDetailController = Get.find<MovieDetailController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      child: isLoading
          ? ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                    baseColor: ThemeConstants.clrLightBlueGrey,
                    highlightColor: ThemeConstants.clrBlack100,
                    child: Container(
                      width: 30.w,
                      margin: const EdgeInsets.only(
                        right: 15,
                        top: 10,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeConstants
                            .clrLightBlueGrey, //ThemeConstants.clrBlack
                      ),
                    ));
              })
          : Obx(() {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: moviesList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      movieDetailController.getMovieDetail(moviesList[index].id ?? 0);
                      Get.toNamed(AppRoutes.movieDetailRoute);
                    },
                    child: Container(
                      width: 30.w,
                      margin: const EdgeInsets.only(
                        right: 15,
                        top: 10,
                        bottom: 10,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeConstants.clrLightBlueGrey, //ThemeConstants.clrBlack
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w200${moviesList[index].posterPath}',
                            placeholder: (context, url) {
                              return Shimmer.fromColors(
                                baseColor: ThemeConstants.clrLightBlueGrey,
                                highlightColor: ThemeConstants.clrBlack100,
                                child: SizedBox(
                                  height: 18.6.h,
                                  width: 30.w,
                                ),
                              );
                            },
                            height: 18.5.h,
                            width: 30.w,
                            fit: BoxFit.cover,
                          ),
                          Container(
                           height: 3.h,
                            //color: Colors.teal,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
                            child: Text(moviesList[index].title ?? '',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: ThemeConstants.clrWhite,
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
    );
  }
}
