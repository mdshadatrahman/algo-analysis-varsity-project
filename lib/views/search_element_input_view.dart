import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:search_alog_proj/main.dart';
import 'package:search_alog_proj/provider/main_provider.dart';
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
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onSubmitted: (v) {
                        if (v.isNotEmpty) {
                          context.read<MainProvider>().setSearchElement(int.parse(v));
                        }
                      },
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: CupertinoButton.filled(
                  onPressed: () {
                    if (inputController.text.isNotEmpty) {
                      context.read<MainProvider>().setSearchElement(int.parse(inputController.text));
                    }
                    if (context.read<MainProvider>().searchElement == null) {
                      showDialog(
                        context: context,
                        builder: (ctx) {
                          return CupertinoAlertDialog(
                            title: const Text('Error'),
                            content: const Text('Please enter a number to search'),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }
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
