import 'package:first_flutter/pages/lifecycle_demo/widget_counter.dart';
import 'package:flutter/material.dart';

class StatefulPage extends StatefulWidget {
  final String headerTitle;
  StatefulPage({super.key, required this.headerTitle}) {
    print('=============================');
    print('constructor');
  }

  @override
  State<StatefulPage> createState() {
    print('createState()');
    return _StatefulPageState();
  }
}

class _StatefulPageState extends State<StatefulPage> {
  int count = 0;
  @override
  void initState() {
    print('initState()');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies()');
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    print('deactivate()');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('buildParent()');
    return Scaffold(
      appBar: AppBar(title: Text(widget.headerTitle)),
      body: Center(child: WidgetCounter(count: count)),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            count += 1;
          });
        },
      ),
    );
  }
}
