import 'package:flutter/material.dart';

class StopwatchPage extends StatelessWidget {
  final String title;
  const StopwatchPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Stopwatch'),
    );
  }
}
