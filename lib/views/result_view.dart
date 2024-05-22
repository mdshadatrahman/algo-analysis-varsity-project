import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_alog_proj/provider/main_provider.dart';

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
        child: Consumer<MainProvider>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Algorithm Type: ${value.searchType!.name.toString().toTitleCase} search',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  value.searchResult.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

extension on String {
  String get toTitleCase => this[0].toUpperCase() + substring(1);
}
