import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_alog_proj/gen/assets.gen.dart';
import 'package:search_alog_proj/main.dart';
import 'package:search_alog_proj/views/searching_alog_view.dart';
import 'package:search_alog_proj/views/sorting_alog_view.dart';
import 'package:search_alog_proj/widgets/button_with_image_on_top.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    imagePath: Assets.searching.path,
                    buttonText: 'Searching Algorithms',
                    onPressed: () {
                      // context.read<MainProvider>().setSearchType(SearchType.linear);
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (ctx) {
                            return const SearchingAlogView();
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ButtonWithImageOnTop(
                    imagePath: Assets.sorting.path,
                    buttonText: 'Sorting Algorithms',
                    onPressed: () {
                      // context.read<MainProvider>().setSearchType(SearchType.binary);
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (ctx) {
                            return const SortingAlogView();
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
