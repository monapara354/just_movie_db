import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_movie/features/movie_details/presentation/controller/movie_detail_controller.dart';
import 'package:sizer/sizer.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieDetailScreen({super.key});

  final movieDetailController = Get.find<MovieDetailController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx(() {
        final movieInfo = movieDetailController.movieInfo.value;
        return movieInfo != null ? Column(
          children: [
            Stack(
              children: [
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 0.8,
                          color: Colors.blueGrey)
                    ],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: CachedNetworkImage(
                    imageUrl:'https://image.tmdb.org/t/p/w300${movieInfo.posterPath}',
                    width: 35.w,
                    //150
                    height: 30.h,
                    fit: BoxFit.fill,
                    placeholder: (context, url) {
                      return Center(
                          child: Container(
                            color: const Color.fromARGB(
                                255, 65, 65, 65),
                          ));
                    },
                    errorWidget: (context, url, error) {
                      return const Icon(
                        Icons.person,
                        color: Colors.cyan,
                        size: 50,
                      );
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      //  color: Colors.brown,
                      width: 50.w,
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                         movieInfo.title.toString(),
                        style: const TextStyle(
                            fontSize: 25, color: Colors.white),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    Container(
                      margin:
                      const EdgeInsets.only(left: 20, top: 5),
                      child: Text(
                       // movieInfo.releaseDate.toString(),

                        movieDetailController.durationToString(
                            movieInfo.runtime ?? 0),
                        // snapshot.data!.runtime.toString() +
                        //     'min ',
                        style: const TextStyle(
                            fontSize: 16, color: Colors.white),
                      ),
                    ),

                  ],
                ),
              ],
            ),

          ],
        ) : Center(
          child: Text('Nodata found'),
        );
      }),
    );
  }
}
