import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:search_alog_proj/main.dart';
import 'package:search_alog_proj/providers/search_provider.dart';
import 'package:search_alog_proj/providers/sort_provider.dart';
import 'package:search_alog_proj/utils/enums.dart';
import 'package:search_alog_proj/views/search_element_input_view.dart';
import 'package:search_alog_proj/views/sort_result_view.dart';
import 'package:search_alog_proj/widgets/entered_numbers.dart';

class ArrayInputView extends StatefulWidget {
  const ArrayInputView({
    super.key,
    required this.title,
    required this.algorithmType,
  });

  final String title;
  final AlgorithmType algorithmType;

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
      appBar: CupertinoNavigationBar(middle: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enter numbers: ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: inputController,
                        keyboardType: TextInputType.number,
                        focusNode: focusNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter a number and press enter to add it to the list.',
                        ),
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            if (widget.algorithmType == AlgorithmType.search) {
                              context.read<SearchProvider>().addToNumbers(int.parse(value));
                            } else {
                              context.read<SortProvider>().addToNumbers(int.parse(value));
                            }

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
                    const SizedBox(height: 20),
                    if (widget.algorithmType == AlgorithmType.search)
                      Consumer<SearchProvider>(
                        builder: (context, provider, child) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: scrollController,
                            child: Row(
                              children: [
                                for (int i = 0; i < provider.numbers.length; i++) ...[
                                  EnteredNumber(
                                    number: provider.numbers[i],
                                    onRemove: () {
                                      provider.removeNumber(i);
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ],
                            ),
                          );
                        },
                      )
                    else
                      Consumer<SortProvider>(
                        builder: (context, provider, child) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: scrollController,
                            child: Row(
                              children: [
                                for (int i = 0; i < provider.numbers.length; i++) ...[
                                  EnteredNumber(
                                    number: provider.numbers[i],
                                    onRemove: () {
                                      provider.removeNumber(i);
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ],
                            ),
                          );
                        },
                      ),
                    const SizedBox(height: 20),
                    if (widget.algorithmType == AlgorithmType.sort)
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButton(
                                value: context.watch<SortProvider>().orderType,
                                hint: const Text('Select order type'),
                                underline: const SizedBox(),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                isExpanded: true,
                                items: const [
                                  DropdownMenuItem(
                                    value: OrderType.ascending,
                                    child: Text('Ascending'),
                                  ),
                                  DropdownMenuItem(
                                    value: OrderType.descending,
                                    child: Text('Descending'),
                                  ),
                                ],
                                onChanged: (OrderType? value) {
                                  context.read<SortProvider>().orderType = value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        Expanded(
                          child: CupertinoButton.filled(
                            onPressed: () {
                              if (widget.algorithmType == AlgorithmType.search) {
                                Navigator.of(context).push(
                                  CupertinoPageRoute(
                                    builder: (ctx) {
                                      return const SearchElementInputView();
                                    },
                                  ),
                                );
                              } else {
                                if (context.read<SortProvider>().numbers.isEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return CupertinoAlertDialog(
                                        title: const Text('Error'),
                                        content: const Text('Please enter numbers to sort.'),
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

                                context.read<SortProvider>().sortNumbers();
                                Navigator.of(context).push(
                                  CupertinoPageRoute(
                                    builder: (ctx) {
                                      return const SortResultView();
                                    },
                                  ),
                                );
                              }
                            },
                            child: const Text('Next'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
