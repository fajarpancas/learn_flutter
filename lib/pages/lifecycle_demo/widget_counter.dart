import 'package:flutter/material.dart';

class WidgetCounter extends StatefulWidget {
  int count;
  WidgetCounter({super.key, required this.count}) {
    print('-----------------------------');
    print('constructorChild');
  }

  @override
  State<WidgetCounter> createState() => _WidgetCounterState();
}

class _WidgetCounterState extends State<WidgetCounter> {
  @override
  void didUpdateWidget(covariant WidgetCounter oldWidget) {
    print('didUpdateWidget');
    print('oldWidget: ${oldWidget.count}');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Text('${widget.count}', style: const TextStyle(fontSize: 40));
  }
}
