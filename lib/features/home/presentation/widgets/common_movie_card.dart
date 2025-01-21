import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:just_movie/core/constants/image_constants.dart";
import "package:just_movie/core/constants/theme_constants.dart";
import "package:just_movie/core/services/api_urls.dart";
import "package:shimmer/shimmer.dart";
import "package:sizer/sizer.dart";

class CommonMovieCard extends StatelessWidget {
  const CommonMovieCard({
    required this.onTap, super.key,
    this.imagePoster,
    this.name,
  });

  final Function() onTap;
  final String? imagePoster;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeConstants.clrLightBlueGrey,
      ),
      clipBehavior: Clip.hardEdge,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(
              width: 115,
              height: 150,
              child: CachedNetworkImage(
                imageUrl: "${EndPoints.imageBaseUrl200}$imagePoster",
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: ThemeConstants.clrLightBlueGrey,
                    highlightColor: ThemeConstants.clrBlack100,
                    child: Container(
                      width: 115,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeConstants.clrLightBlueGrey,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return Image.asset(
                    ImageConstants.imgPosterPlace,
                    fit: BoxFit.cover,
                  );
                },
                width: 115,
                height: 150,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
                left: 2,
                right: 2,
              ),
              child: Text(
                name ?? "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: ThemeConstants.clrWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
