import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_alog_proj/gen/assets.gen.dart';
import 'package:search_alog_proj/main.dart';
import 'package:search_alog_proj/providers/search_provider.dart';
import 'package:search_alog_proj/utils/enums.dart';
import 'package:search_alog_proj/views/array_input_view.dart';
import 'package:search_alog_proj/widgets/button_with_image_on_top.dart';

class SearchingAlogView extends StatelessWidget {
  const SearchingAlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(middle: Text('Searching Algorithms')),
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
                    imagePath: Assets.linearSearch.path,
                    buttonText: 'Linear Search',
                    onPressed: () {
                      context.read<SearchProvider>().setSearchType(SearchType.linear);
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (ctx) {
                            return const ArrayInputView(
                              title: 'Linear Search',
                              algorithmType: AlgorithmType.search,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ButtonWithImageOnTop(
                    imagePath: Assets.binarySearch.path,
                    buttonText: 'Binary Search',
                    onPressed: () {
                      context.read<SearchProvider>().setSearchType(SearchType.binary);
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (ctx) {
                            return const ArrayInputView(
                              title: 'Binary Search',
                              algorithmType: AlgorithmType.search,
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
