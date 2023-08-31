import 'package:flutter/material.dart';

class CustomProgressIndicator {
  Future showProgressIndicator(context) async {
    FocusScope.of(context).unfocus();
    if (ModalRoute.of(context)?.isCurrent ?? true) {
      await showGeneralDialog(
          barrierLabel: "Barrier",
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

  Future showProgressIndicatorMessage(context, String text) async {
    FocusScope.of(context).unfocus();
    if (ModalRoute.of(context)?.isCurrent ?? true) {
      await showGeneralDialog(
          barrierLabel: "Barrier",
          barrierDismissible: false,
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: const Duration(milliseconds: 500),
          context: context,
          pageBuilder: (_, __, ___) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
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
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
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

  SizedBox _spacer(context, double height) {
    return SizedBox(height: MediaQuery.of(context).size.height * height);
  }
}
