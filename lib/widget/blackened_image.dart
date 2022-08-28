import 'package:flutter/material.dart';

class BlackenedImage extends DecorationImage {
  BlackenedImage(
    ImageProvider image,
    BoxFit? boxFit,
    Color? color,
  ) : super(
          image: image,
          fit: boxFit ?? BoxFit.cover,
          colorFilter:
              ColorFilter.mode(color ?? Colors.black45, BlendMode.darken),
        );
}
