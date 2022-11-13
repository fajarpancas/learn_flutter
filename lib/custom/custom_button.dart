import 'package:flutter/material.dart';

Widget buildCustomButton(String title, Function onTap, List gradient,
    double width, double height, double borderRadius) {
  return Material(
    elevation: 2,
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(borderRadius),
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
              colors: [gradient[0], gradient[1]],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap();
          },
          borderRadius: BorderRadius.circular(borderRadius),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    ),
  );
}
