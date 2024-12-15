import "package:flutter/cupertino.dart";
import "package:get/get.dart";
import "package:just_movie/core/constants/theme_constants.dart";

Future<void> showToast({
  required String title,
  SnackPosition? position,
  Duration? duration,
}) async {
  if (Get.isSnackbarOpen) {
    await Get.closeCurrentSnackbar();
  }
  Get.snackbar(
    title,
    "",
    messageText: const SizedBox.shrink(),
    colorText: ThemeConstants.clrBlack,
    backgroundColor: ThemeConstants.clrWhite,
    snackPosition: position ?? SnackPosition.BOTTOM,
    duration: duration ?? 2.seconds,
    padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
    margin: const EdgeInsets.all(20),
  );
}
