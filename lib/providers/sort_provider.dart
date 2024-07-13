import 'package:flutter/material.dart';
import 'package:search_alog_proj/functions/bubble_sort_alog.dart';
import 'package:search_alog_proj/functions/counting_sort_algo.dart';
import 'package:search_alog_proj/functions/heap_sort_algo.dart';
import 'package:search_alog_proj/functions/insertion_sort_alog.dart';
import 'package:search_alog_proj/functions/merge_sort_algo.dart';
import 'package:search_alog_proj/functions/quick_sort_algo.dart';
import 'package:search_alog_proj/functions/radix_sort_algo.dart';
import 'package:search_alog_proj/functions/selection_sort_alog.dart';
import 'package:search_alog_proj/models/sorted_result_model.dart';
import 'package:search_alog_proj/utils/enums.dart';

class SortProvider extends ChangeNotifier {
  void cleanState() {
    orderType = null;
    clearNumbers();
    sortedResult = null;
    notifyListeners();
  }

  OrderType? _orderType;
  OrderType? get orderType => _orderType;
  set orderType(OrderType? orderType) {
    _orderType = orderType;
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

  SortedResultModel? _sortedResult;
  SortedResultModel? get sortedResult => _sortedResult;
  set sortedResult(SortedResultModel? sortedResult) {
    _sortedResult = sortedResult;
    notifyListeners();
  }

  SortType? _sortType;
  SortType? get sortType => _sortType;
  set sortType(SortType? sortType) {
    _sortType = sortType;
    notifyListeners();
  }

  void sortNumbers() {
    if (numbers.isEmpty) {
      return;
    }
    if (sortType == null || orderType == null) {
      return;
    }

    switch (sortType!) {
      case SortType.bubble:
        sortedResult = bubbleSort(numbers: numbers, isAscending: orderType == OrderType.ascending);
        break;
      case SortType.insertion:
        sortedResult = insertionSort(numbers: numbers, isAscending: orderType == OrderType.ascending);
        break;
      case SortType.selection:
        sortedResult = selectionSort(numbers: numbers, isAscending: orderType == OrderType.ascending);
        break;
      case SortType.quick:
        sortedResult = quickSort(numbers: numbers, isAscending: orderType == OrderType.ascending);
        break;
      case SortType.merge:
        sortedResult = mergeSort(numbers: numbers, isAscending: orderType == OrderType.ascending);
      case SortType.counting:
        sortedResult = coutingSort(numbers: numbers);
        break;
      case SortType.radix:
        sortedResult = radixSort(numbers: numbers);
        break;
      case SortType.heap:
        sortedResult = heapSort(numbers: numbers);
        break;
    }
  }
}
