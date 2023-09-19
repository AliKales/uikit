import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showSnackBar({
    required BuildContext context,
    required String text,
    Widget? suffix,
    Duration? duration,
    Color? background,
    TextStyle? textStyle,
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
                      style: textStyle,
                    ),
                  ),
                  suffix
                ],
              )
            : Text(
                text,
                style: textStyle,
              ),
        duration: duration ?? const Duration(milliseconds: 4000),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  static void showSpecialSnackBar(
    BuildContext context, {
    required String text,
    required bool isSuccess,
    Duration? duration,
  }) {
    Color background =
        isSuccess ? const Color(0xFFeafbf6) : const Color(0xFFfdedee);

    Color iconColor =
        isSuccess ? const Color(0xFF3cd4a1) : const Color(0xFFf14f63);

    IconData iconData = isSuccess ? Icons.check_circle : Icons.error;

    showSnackBar(
      context: context,
      text: text,
      background: background,
      duration: duration,
      textStyle: const TextStyle(color: Colors.black),
      suffix: Icon(
        iconData,
        color: iconColor,
      ),
    );
  }
}
