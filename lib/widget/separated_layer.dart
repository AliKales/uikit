import 'package:flutter/material.dart';

class SeparatedLayer extends StatelessWidget {
  const SeparatedLayer({
    super.key,
    this.axis = Axis.vertical,
    this.separator,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final Axis? axis;
  final Widget? separator;
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;

  List<Widget> _children() {
    if (separator == null) return children;
    List<Widget> returnList = [];

    for (var widget in children) {
      returnList.add(widget);
      returnList.add(separator!);
    }

    if(returnList.isNotEmpty) returnList.removeLast();

    return returnList;
  }

  @override
  Widget build(BuildContext context) {
    if (axis == Axis.horizontal) {
      return Row(
        crossAxisAlignment: crossAxisAlignment!,
        mainAxisAlignment: mainAxisAlignment!,
        mainAxisSize: mainAxisSize!,
        children: _children(),
      );
    } else {
      return Column(
        crossAxisAlignment: crossAxisAlignment!,
        mainAxisAlignment: mainAxisAlignment!,
        mainAxisSize: mainAxisSize!,
        children: _children(),
      );
    }
  }
}
