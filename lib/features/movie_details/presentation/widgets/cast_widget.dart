import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:just_movie/core/constants/image_constants.dart";
import "package:just_movie/core/constants/theme_constants.dart";
import "package:just_movie/core/services/api_urls.dart";
import "package:sizer/sizer.dart";

class CastWidget extends StatelessWidget {
  const CastWidget({
    required this.onTap, required this.profilePath, required this.name, required this.characterName, super.key,
  });

  final Function() onTap;
  final String profilePath;
  final String name;
  final String characterName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 95.sp,
        decoration: BoxDecoration(
          color: ThemeConstants.clrDarkBlueGrey,
          border: Border.all(color: ThemeConstants.clrGrey),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.hardEdge,
              child: CachedNetworkImage(
                imageUrl: "${EndPoints.imageBaseUrl200}$profilePath",
                errorWidget: (context, url, error) {
                  return Image.asset(
                    ImageConstants.imgUserPlace,
                    fit: BoxFit.fill,
                  );
                },
                fit: BoxFit.fill,
                height: 80,
                width: 80,
              ),
            ),
            Flexible(
              child: Text(
                name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              characterName,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white60,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
