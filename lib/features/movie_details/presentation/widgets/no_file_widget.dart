import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_movie/core/constants/image_constants.dart';
import 'package:just_movie/core/constants/theme_constants.dart';

class NoFileWidget extends StatelessWidget {
  const NoFileWidget({super.key, this.isBack = true});

  final bool isBack;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isBack)
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
              ),
              child: IconButton(
                color: ThemeConstants.clrAmberYellow,
                style: IconButton.styleFrom(
                  backgroundColor: ThemeConstants.clrLightBlueGrey,
                ),
                iconSize: 28,
                onPressed: Get.back,
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    ImageConstants.imgNotFound,
                    height: 200,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
