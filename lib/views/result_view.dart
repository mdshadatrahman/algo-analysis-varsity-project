import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('Result'),
        trailing: IconButton(
          icon: const Icon(CupertinoIcons.home),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ),
      body: Center(
        child: Text(
          'Result view',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
