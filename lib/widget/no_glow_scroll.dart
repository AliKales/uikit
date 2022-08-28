import 'package:flutter/material.dart';

///[NoGlowScroll] disables glow effect when user scrolls till end
///but it must take only one value
class NoGlowScroll extends StatelessWidget {
  const NoGlowScroll({
    Key? key,
    this.listView,
    this.singleChildScrollView,
  })  : assert(
          listView == null || singleChildScrollView == null,
          "You can use only one",
        ),
        super(key: key);

  final ListView? listView;
  final SingleChildScrollView? singleChildScrollView;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: const SingleChildScrollView());
  }
}
