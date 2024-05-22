import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Result view',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
