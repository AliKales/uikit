import 'package:flutter/material.dart';

class CustomBottomSheet {
  static void showCustomModalBottomSheet(
    BuildContext context, {
    required List<Widget> children,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.9,
            builder: (context, controller) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: DefaultTextStyle.merge(
                  style: Theme.of(context).textTheme.titleLarge,
                  child: ListView(
                    controller: controller,
                    children: [
                      CustomBottomSheet()._dividerForBottomSheet(context),
                      ...children,
                    ],
                  ),
                ),
              );
            });
      },
    );
  }

  Padding _dividerForBottomSheet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          height: 6,
          width: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.shadow,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
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
