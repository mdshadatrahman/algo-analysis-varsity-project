import 'package:flutter/material.dart';
import 'package:search_alog_proj/functions/binary_search_algo.dart';
import 'package:search_alog_proj/functions/linear_search_algo.dart';
import 'package:search_alog_proj/models/search_result_model.dart';
import 'package:search_alog_proj/utils/enums.dart';

class MainProvider extends ChangeNotifier {
  SearchType? _searchType;
  SearchType? get searchType => _searchType;
  void setSearchType(SearchType searchType) {
    _searchType = searchType;
    notifyListeners();
  }

  final List<int> _numbers = [];
  List<int> get numbers => _numbers;
  void addToNumbers(int number) {
    _numbers.add(number);
    notifyListeners();
  }

  void clearNumbers() {
    _numbers.clear();
    notifyListeners();
  }

  void removeNumber(int index) {
    _numbers.removeAt(index);
    notifyListeners();
  }

  int? _searchElement;
  int? get searchElement => _searchElement;
  void setSearchElement(int searchElement) {
    _searchElement = searchElement;

    switch (searchType) {
      case SearchType.linear:
        setSearchResult(linearSearch(numbers, searchElement));
        break;
      case SearchType.binary:
        setSearchResult(binarySearch(numbers, searchElement));
        break;
      default:
        break;
    }

    notifyListeners();
  }

  SearchResultModel? _searchResult;
  SearchResultModel? get searchResult => _searchResult;
  void setSearchResult(SearchResultModel? searchResult) {
    _searchResult = searchResult;
    notifyListeners();
  }
}
