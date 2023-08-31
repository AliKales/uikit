import 'package:flutter/material.dart';

class CustomBottomSheet {
  static void showCustomModalBottomSheet(
    BuildContext context, {
    Color? backgroundColor,
    required Widget child,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: _shape(),
      builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              _dividerForBottomSheet(context, backgroundColor: backgroundColor),
              Expanded(child: child),
            ],
          ),
        );
      },
    );
  }

  static RoundedRectangleBorder _shape() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    );
  }

  static Widget _dividerForBottomSheet(
    BuildContext context, {
    Color? backgroundColor,
  }) {
    return Container(
      width: double.maxFinite,
      height: 20,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Center(
        child: Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.shadow,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  void showCustomBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return const Text("data");
      },
    );
  }
}
