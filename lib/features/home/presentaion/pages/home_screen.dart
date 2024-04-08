import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/constants/string_constants.dart';
import 'package:just_movie/core/constants/theme_constants.dart';
import 'package:just_movie/features/home/presentaion/controller/home_controller.dart';
import 'package:just_movie/features/home/presentaion/widgets/movie_list.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(StringConstants.strAppName),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              StringConstants.strNowPlaying,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 23.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: homeController.moviesList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 30.w,
                    margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ThemeConstants.clrBlack
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        Image.network(
                          homeController.moviesList[index]['url'],
                          height: 16.h,
                          width: 30.w,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.medium,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                          child: Text(
                            homeController.moviesList[index]['title'],
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: ThemeConstants.clrWhite,
                            )
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Text(
              StringConstants.strNowPlaying,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            MovieList(moviesList: homeController.moviesList)
          ],
        ),
      ),
    );
  }
}
