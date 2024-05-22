import 'package:flutter/material.dart';

class SearchElementInputView extends StatelessWidget {
  const SearchElementInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Search element input view',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
