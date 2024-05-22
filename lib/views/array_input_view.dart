import 'package:flutter/material.dart';

class ArrayInputView extends StatelessWidget {
  const ArrayInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Array input view',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
