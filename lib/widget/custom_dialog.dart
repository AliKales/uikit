import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uikit/widget/index.dart';

class CustomDialog {
  static Future<void> showMyDialog({
    required BuildContext context,
    String? title,
    String? text,
    List<Widget>? actions,
    bool? barrierDismissible,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
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
      barrierDismissible: true,
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

  static Future<int?> showDialogRadios({
    required BuildContext context,
    required List<String> list,
    String? title,
  }) async {
    ValueNotifier<int> groupValue = ValueNotifier(-1);

    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? ""),
          contentPadding: EdgeInsets.zero,
          content: kIsWeb
              ? SizedBox(
                  height: 200,
                  width: 200,
                  child: _widget(list, groupValue),
                )
              : FractionallySizedBox(
                  heightFactor: 0.7,
                  child: _widget(list, groupValue),
                ),
          actions: [
            TextButton(
              onPressed: () {
                if (groupValue.value != -1) Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );

    return groupValue.value == -1 ? null : groupValue.value;
  }

  static Column _widget(List<String> list, ValueNotifier<int> groupValue) {
    return Column(
      children: [
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ValueListenableBuilder(
                valueListenable: groupValue,
                builder: (context, _, __) {
                  return ListTile(
                    onTap: () => groupValue.value = index,
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(list[index]),
                    leading: Radio<int>(
                      value: index,
                      groupValue: groupValue.value,
                      onChanged: (value) => groupValue.value = value!,
                    ),
                  );
                },
              );
            },
          ),
        ),
        const Divider(),
      ],
    );
  }
}
