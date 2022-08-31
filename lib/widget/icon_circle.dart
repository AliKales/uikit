import 'package:flutter/material.dart';

class IconCircle extends StatelessWidget {
  const IconCircle({Key? key, required this.iconData, this.onClick})
      : super(key: key);

  final IconData iconData;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    if (onClick == null) {
      return _icon(context);
    }

    return IconButton(onPressed: onClick, icon: _icon(context));
  }

  Widget _icon(context) => _decoratedBox(
        context,
        Icon(
          iconData,
          size: 20,
        ),
      );

  DecoratedBox _decoratedBox(BuildContext context, Widget child) =>
      DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: child,
        ),
      );
}
