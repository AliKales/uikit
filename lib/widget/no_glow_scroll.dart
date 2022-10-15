import 'package:flutter/material.dart';

///[NoGlowScroll] disables glow effect when user scrolls till end
///but it must take only one value
class NoGlowScroll extends StatelessWidget {
  const NoGlowScroll({
    Key? key,
    required this.child,
    this.disableScroll = false,
    this.scrollPhysics,
    this.scrollController,
  })  : assert(
          !(scrollController != null && child is ListView),
          "You can not insert a ScrollController when you use ListView",
        ),
        super(key: key);

  final Widget child;
  final bool? disableScroll;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: child is ListView
          ? child
          : SingleChildScrollView(
              controller: scrollController,
              physics: disableScroll!
                  ? const NeverScrollableScrollPhysics()
                  : scrollPhysics,
              child: child,
            ),
    );
  }
}
