import 'package:flutter/material.dart';
import 'package:uikit/widget/index.dart';

///[MenuWidget] is an widget that shows a menu and return clicked value
class MenuWidget<T> extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.child,
    required this.items,
    required this.item,
    required this.onClick,
  });

  final Widget child;
  final List<T> items;
  final Widget Function(int index, T item) item;
  final Function(int index, T item) onClick;

  void _showList(BuildContext context) async {
    final result = await showMenu<int?>(
      context: context,
      position: _getRelativeRect(context),
      items: List.generate(
        items.length,
        (index) => PopupMenuItem(
          value: index,
          child: item.call(index, items[index]),
        ),
      ),
    );

    if (result == null) return;

    onClick.call(result, items[result]);
  }

  RelativeRect _getRelativeRect(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    //*get the global position, from the widget local position
    final offset = renderBox.localToGlobal(Offset.zero);

    //*calculate the start point in this case, below the button
    final left = offset.dx;
    final top = offset.dy + renderBox.size.height;
    //*The right does not indicates the width
    final right = left + renderBox.size.width;

    return RelativeRect.fromLTRB(left, top, right, 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return InkWellNoGlow(
      onTap: () => _showList(context),
      child: child,
    );
  }
}
