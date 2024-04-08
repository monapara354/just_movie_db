import 'package:flutter/material.dart';
import 'package:just_movie/core/constants/theme_constants.dart';
import 'package:sizer/sizer.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key, required this.moviesList});

  final List moviesList;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 23.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: moviesList.length,
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
                  moviesList[index]['url'],
                  height: 16.h,
                  width: 30.w,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.medium,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                  child: Text(
                      moviesList[index]['title'],
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
    );
  }
}
