import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContextMenuWidget extends StatelessWidget {
  const ContextMenuWidget(
      {super.key,
      required this.icons,
      required this.onClicked,
      required this.child,
      this.isLongPress = false});

  final List<IconData> icons;
  final Function(int) onClicked;
  final Widget child;
  final bool? isLongPress;

  Future<void> _onClick(context) async {
    int result = await CustomContextMenu.showContextMenu(context, icons: icons);
    onClicked.call(result);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isLongPress! ? {} : _onClick(context),
      onLongPress: () => isLongPress! ? _onClick(context) : {},
      child: child,
    );
  }
}

class CustomContextMenu {
  ///[showContextMenu] will return -1 if none of buttons pressed
  static Future<int> showContextMenu(
    BuildContext context, {
    required List<IconData> icons,
  }) async {
    assert(icons.length < 6, "Max 5 Icons");

    int valReturn = -1;

    RenderBox box = context.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);

    var size = MediaQuery.of(context).size;

    await showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.2),
      builder: (context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
            ),
            Positioned(
              top: position.dy,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration( 
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(26),
                  ),
                ),
                child: Row(
                  children: List.generate(
                    icons.length,
                    (index) => CustomContextMenu()._item(
                      context,
                      index,
                      (p0) {
                        valReturn = p0;
                        Navigator.pop(context);
                      },
                      icons[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    return valReturn;
  }

  Widget _item(BuildContext context, int index, Function(int) onPressed,
      IconData iconData) {
    var delay = (index * 100).ms;
    var duration = const Duration(milliseconds: 500);
    return IconButton(
      onPressed: () => onPressed.call(index),
      icon: Icon(iconData),
    )
        .animate()
        .fadeIn(
          delay: delay,
          duration: duration,
        )
        .scale(
            delay: delay, curve: Curves.bounceOut, duration: duration + 50.ms);
  }
}
