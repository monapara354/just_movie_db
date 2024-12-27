import 'package:flutter/material.dart';
import 'package:just_movie/core/constants/theme_constants.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ThemeConstants.clrLightBlueGrey,
        border: Border.all(
          color: ThemeConstants.clrBlueGrey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      margin: const EdgeInsets.only(left: 7, top: 5),
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 13,
          color: ThemeConstants.clrWhite,
        ),
      ),
    );
  }
}
