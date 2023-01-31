import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showSnackBar({
    required BuildContext context,
    required String text,
    Widget? suffix,
    Duration? duration,
    Color? background,
  }) {
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: background,
        content: suffix != null
            ? Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                    ),
                  ),
                  suffix
                ],
              )
            : Text(
                text,
              ),
        duration: duration ?? const Duration(milliseconds: 4000),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
