import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_alog_proj/gen/assets.gen.dart';
import 'package:search_alog_proj/main.dart';
import 'package:search_alog_proj/providers/sort_provider.dart';
import 'package:search_alog_proj/utils/enums.dart';
import 'package:search_alog_proj/views/array_input_view.dart';
import 'package:search_alog_proj/widgets/button_with_image_on_top.dart';

class SortingAlogView extends StatelessWidget {
  const SortingAlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(middle: Text('Sorting Algorithms')),
      body: SizedBox(
        height: height,
        width: width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonWithImageOnTop(
                    imagePath: Assets.bubbleSort.path,
                    buttonText: 'Bubble Sort',
                    onPressed: () {
                      context.read<SortProvider>().sortType = SortType.bubble;
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (ctx) {
                            return const ArrayInputView(
                              title: 'Bubble Sort',
                              algorithmType: AlgorithmType.sort,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ButtonWithImageOnTop(
                    imagePath: Assets.insertionSort.path,
                    buttonText: 'Insertion Sort',
                    onPressed: () {
                      context.read<SortProvider>().sortType = SortType.insertion;
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (ctx) {
                            return const ArrayInputView(
                              title: 'Insertion Sort',
                              algorithmType: AlgorithmType.sort,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonWithImageOnTop(
                    imagePath: Assets.selectionSort.path,
                    buttonText: 'Selection Sort',
                    onPressed: () {
                      context.read<SortProvider>().sortType = SortType.selection;
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (ctx) {
                            return const ArrayInputView(
                              title: 'Selection Sort',
                              algorithmType: AlgorithmType.sort,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ButtonWithImageOnTop(
                    imagePath: Assets.quickSort.path,
                    buttonText: 'Quick Sort',
                    onPressed: () {
                      context.read<SortProvider>().sortType = SortType.quick;
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (ctx) {
                            return const ArrayInputView(
                              title: 'Quick Sort',
                              algorithmType: AlgorithmType.sort,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonWithImageOnTop(
                    imagePath: Assets.mergeSort.path,
                    buttonText: 'Merge Sort',
                    onPressed: () {
                      context.read<SortProvider>().sortType = SortType.merge;
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (ctx) {
                            return const ArrayInputView(
                              title: 'Merge Sort',
                              algorithmType: AlgorithmType.sort,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
