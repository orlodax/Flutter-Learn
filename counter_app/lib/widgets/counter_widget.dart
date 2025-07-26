import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final int counter;
  const CounterWidget({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('You have pushed the button this many times:'),
        Text('$counter', style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
