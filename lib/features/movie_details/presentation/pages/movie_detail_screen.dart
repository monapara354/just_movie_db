import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [

            ],
          ),
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
              imageUrl:
              'https://image.tmdb.org/t/p/w300',
              width: 35.w, //150
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
        ],
      ),
    );
  }
}
