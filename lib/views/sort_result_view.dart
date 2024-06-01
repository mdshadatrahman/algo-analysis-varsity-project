import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_alog_proj/providers/search_provider.dart';
import 'package:search_alog_proj/providers/sort_provider.dart';

class SortResultView extends StatelessWidget {
  const SortResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('Result'),
        trailing: IconButton(
          icon: const Icon(CupertinoIcons.home),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Provider.of<SearchProvider>(context, listen: false).cleanState();
          },
        ),
      ),
      body: Center(
        child: Consumer<SortProvider>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Algorithm Type: ${value.sortedResult?.name.toString().toTitleCase}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Sorting Order: ${value.orderType?.name.toString().toTitleCase}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Input: ${value.numbers.join(', ')}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Sorted: ${value.sortedResult}',
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
