import 'package:flutter/material.dart';
import 'package:uikit/widget/index.dart';

class CustomDialog {
  static Future<void> showMyDialog({
    required BuildContext context,
    String? title,
    String? text,
    List<Widget>? actions,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: Text(text ?? ""),
          actions: actions,
        );
      },
    );
  }

  static Future<String?> showDialogTextField({
    required BuildContext context,
    String? title,
    List<Widget>? actions,
  }) async {
    String? textToReturn;

    await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: TextFieldRounded(
            hintText: "Text here...",
            keyboardType: TextInputType.number,
            onChanged: (text) {
              textToReturn = text;
            },
          ),
          actions: actions,
        );
      },
    );

    return textToReturn;
  }
}
