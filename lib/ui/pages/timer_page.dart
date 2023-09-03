import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  final String title;
  const TimerPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Timer'),
    );
  }
}
