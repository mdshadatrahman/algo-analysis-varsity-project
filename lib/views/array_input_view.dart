import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:search_alog_proj/main.dart';
import 'package:search_alog_proj/provider/main_provider.dart';
import 'package:search_alog_proj/utils/enums.dart';
import 'package:search_alog_proj/views/search_element_input_view.dart';
import 'package:search_alog_proj/widgets/entered_numbers.dart';

class ArrayInputView extends StatefulWidget {
  const ArrayInputView({
    super.key,
    required this.searchType,
  });

  final SearchType searchType;

  @override
  State<ArrayInputView> createState() => _ArrayInputViewState();
}

class _ArrayInputViewState extends State<ArrayInputView> {
  final inputController = TextEditingController();
  final scrollController = ScrollController();

  final focusNode = FocusNode();

  @override
  void dispose() {
    inputController.dispose();
    scrollController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(
          widget.searchType == SearchType.linear ? 'Linear Search' : 'Binary Search',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Input: '),
                          SizedBox(
                            width: width * 0.3,
                            child: CupertinoTextField(
                              controller: inputController,
                              keyboardType: TextInputType.number,
                              focusNode: focusNode,
                              placeholder: 'Enter a number',
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              onSubmitted: (value) {
                                if (value.isNotEmpty) {
                                  context.read<MainProvider>().addToNumbers(int.parse(value));
                                  inputController.clear();
                                  focusNode.requestFocus();
                                  Future.delayed(
                                    const Duration(milliseconds: 100),
                                    () => scrollController.animateTo(
                                      scrollController.position.maxScrollExtent,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 70,
                        height: height * 0.7,
                        child: Consumer<MainProvider>(
                          builder: (context, provider, child) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: provider.numbers.length,
                              controller: scrollController,
                              itemBuilder: (BuildContext context, int index) {
                                return EnteredNumber(
                                  number: provider.numbers[index],
                                  onRemove: () {
                                    provider.removeNumber(index);
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: CupertinoButton.filled(
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (ctx) {
                          return const SearchElementInputView();
                        },
                      ),
                    );
                  },
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
