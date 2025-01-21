import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:just_movie/core/constants/image_constants.dart";
import "package:just_movie/core/constants/theme_constants.dart";
import "package:just_movie/core/services/api_urls.dart";
import "package:shimmer/shimmer.dart";
import "package:sizer/sizer.dart";

class SearchItemView extends StatelessWidget {
  const SearchItemView({
    required this.posterImage, required this.name, super.key,
  });

  final String posterImage;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ThemeConstants.clrLightBlueGrey,
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(
                imageUrl: "${EndPoints.imageBaseUrl200}$posterImage",
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: ThemeConstants.clrLightBlueGrey,
                    highlightColor: ThemeConstants.clrBlack100,
                    child: Container(
                      width: 150,
                      height: 170,
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
                width: 150,
                height: 170,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 2,
                ),
                child: Text(
                  name,
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
      ],
    );
  }
}
