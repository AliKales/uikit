import 'package:flutter/material.dart';

class AnimatedListSeparated extends StatelessWidget {
  const AnimatedListSeparated({
    super.key,
    required this.itemBuilder,
    required this.count,
    this.separateWidget,
  });

  final Widget Function(BuildContext, int, Animation<double>) itemBuilder;
  final int count;
  final Widget? separateWidget;

  @override
  Widget build(BuildContext context) {
    int itemCounter = 0;
    int localCount = count + (count - 1);
    return AnimatedList(
      itemBuilder: (context, index, animation) {
        if (index % 2 == 1 && separateWidget != null) {
          itemCounter++;
          return separateWidget!;
        } else {
          return itemBuilder(context, index - itemCounter, animation);
        }
      },
      initialItemCount: localCount,
    );
  }
}
