import 'package:flutter/material.dart';

Card buildCard(String text) {
  return Card(
    child: Text(
      text,
      style: TextStyle(color: Colors.red),
    ),
  );
}
