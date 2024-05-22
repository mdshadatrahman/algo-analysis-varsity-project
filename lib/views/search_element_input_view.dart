import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_alog_proj/main.dart';
import 'package:search_alog_proj/views/result_view.dart';

class SearchElementInputView extends StatefulWidget {
  const SearchElementInputView({super.key});

  @override
  State<SearchElementInputView> createState() => _SearchElementInputViewState();
}

class _SearchElementInputViewState extends State<SearchElementInputView> {
  final inputController = TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Search Element Input'),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('Enter the element to search: '),
                  SizedBox(
                    width: width * 0.3,
                    child: CupertinoTextField(
                      controller: inputController,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: CupertinoButton.filled(
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (ctx) {
                          return const ResultView();
                        },
                      ),
                    );
                  },
                  child: const Text('Search'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
