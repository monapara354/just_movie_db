import 'package:flutter/material.dart';
import 'package:just_movie/core/constants/theme_constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.title, required this.isLoading});
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading ? Shimmer.fromColors(
      baseColor: ThemeConstants.clrLightBlueGrey,
      highlightColor: ThemeConstants.clrBlack100,
      child: Container(
        width: 35.w,
        height: 8.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ThemeConstants.clrBlack100,
        ),
      ),
    ) : Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        color: ThemeConstants.clrWhite,
      ),
    );
  }
}
