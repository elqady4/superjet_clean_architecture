import 'package:flutter/material.dart';
import 'package:suberjet_clean_architecture/core/style/app_colors.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    Key? key,
    required String message,
    Color backgroundColor = Colors.black,
    Duration duration = const Duration(seconds: 2),
  }) : super(
          key: key,
          content: Text(
            message,
            style: TextStyle(color: AppColors.white),
          ),
          duration: duration,
          backgroundColor: backgroundColor,
        );

  static void show({
    required BuildContext context,
    required String message,
    Color backgroundColor = Colors.black,
    Duration duration = const Duration(seconds: 2),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      CustomSnackBar(
        message: message,
        backgroundColor: backgroundColor,
        duration: duration,
      ),
    );
  }
}
