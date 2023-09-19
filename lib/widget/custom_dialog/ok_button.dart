import 'package:flutter/material.dart';

class OKButton extends TextButton {
  OKButton(
    BuildContext context, {
    dynamic val,
  }) : super(
          child: const Text("OK"),
          onPressed: () => Navigator.pop(context, val),
        );
}
