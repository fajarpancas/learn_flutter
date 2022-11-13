import 'package:flutter/material.dart';

Container Avatar(String assets, double width, double height) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(assets)),
      borderRadius: BorderRadius.circular(width / 2),
    ),
  );
}
