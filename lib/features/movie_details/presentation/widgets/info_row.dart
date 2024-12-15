import 'package:flutter/material.dart';
import 'package:just_movie/core/constants/theme_constants.dart';
import 'package:sizer/sizer.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12.sp,
                color: ThemeConstants.clrLightBlue,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 11.sp,
                color: ThemeConstants.clrWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
