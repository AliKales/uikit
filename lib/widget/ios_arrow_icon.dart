import 'package:flutter/material.dart';

class IosArrowIcon extends RotatedBox {
  IosArrowIcon({
    super.key,
    int? quarterTurn,
    bool? isUp = false,
    double? size,
    VoidCallback? onPressed,
    EdgeInsetsGeometry? padding,
  }) : super(
          quarterTurns: quarterTurn ?? (isUp! ? 1 : 3),
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: padding ?? const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: size,
              ),
            ),
          ),
        );
}
