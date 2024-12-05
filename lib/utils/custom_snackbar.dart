import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBars {
  ///
  /// Error SnackBar
  ///
  static SnackbarController errorSnackBar({
    required String content,
    int? time,
  }) {
    return Get.rawSnackbar(
      message: content,
      backgroundColor: Colors.red.withOpacity(0.8),
      margin: const EdgeInsets.all(15),
      borderRadius: 10,
      duration: Duration(seconds: time ?? 3),
    );
  }

  ///
  /// Success SnackBar
  ///
  static SnackbarController successSnackBar({required String content}) {
    return Get.rawSnackbar(
      message: content,
      backgroundColor: Colors.green.withOpacity(0.8),
      margin: const EdgeInsets.all(15),
      borderRadius: 10,
    );
  }
}
