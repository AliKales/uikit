import 'package:flutter/material.dart';
import 'package:uikit/uikit_extensions.dart';
import 'package:uikit/widget/custom_dialog/ok_button.dart';

part 'text_field_dialog.dart';
part 'radio_list_dialog.dart';

@immutable
final class CustomDialog {
  const CustomDialog._();

  ///[showCustomDialog] shows an Alert Dialog.
  ///[title] is shown on top of the Dialog
  ///you can provide a widget for dialog by [content]
  ///or just a [text]
  ///[actions] is not required but if it is null then
  ///there will be a button with text "OK" and return null
  static Future<T?> showCustomDialog<T>(
    BuildContext context, {
    String? title,
    Widget? content,
    String? text,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) async {
    T? response = await showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text(title ?? "").toEmpty(title.isEmptyOrNull),
          content: content ?? Text(text ?? "").toEmpty(text.isEmptyOrNull),
          actions: actions ?? [OKButton(context)],
        );
      },
    );

    return response;
  }

  static Future<String?> showTextFieldDialog(
    BuildContext context, {
    String? title,
    String? hintText,
    bool barrierDismissible = true,
  }) async {
    String? response = await showDialog<String?>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return _TextFieldDialog(
          barrierDismissible: barrierDismissible,
          title: title,
          hintText: hintText,
        );
      },
    );

    return response;
  }

  static Future<int?> showDialogRadioList(
    BuildContext context, {
    String? title,
    required List<String> items,
  }) async {
    int? response = await showDialog<int?>(
      context: context,
      builder: (context) {
        return _RadioListDialog(
          title: title,
          items: items,
        );
      },
    );

    return response;
  }
}
