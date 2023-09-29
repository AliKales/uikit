import 'package:flutter/material.dart';
import 'package:uikit/uikit_extensions.dart';

@immutable
final class CustomProgressIndicator {
  const CustomProgressIndicator._();

  static Future showProgressIndicator(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (ModalRoute.of(context)?.isCurrent ?? true) {
      await showGeneralDialog(
          barrierDismissible: false,
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: const Duration(milliseconds: 500),
          context: context,
          pageBuilder: (_, __, ___) {
            return WillPopScope(
              onWillPop: () async => false,
              child: const Center(child: CircularProgressIndicator.adaptive()),
            );
          });
    }
  }

  static Future showProgressIndicatorMessage(
      BuildContext context, String text) async {
    FocusScope.of(context).unfocus();
    if (ModalRoute.of(context)?.isCurrent ?? true) {
      await showGeneralDialog(
          barrierDismissible: false,
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: const Duration(milliseconds: 500),
          context: context,
          pageBuilder: (_, __, ___) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.background,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _spacer(context, 0.05),
                      const CircularProgressIndicator.adaptive(),
                      _spacer(context, 0.02),
                      Text(
                        text,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      _spacer(context, 0.05),
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }

  static SizedBox _spacer(context, double height) {
    return SizedBox(height: MediaQuery.of(context).size.height * height);
  }
}
