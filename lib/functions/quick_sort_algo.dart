import 'package:search_alog_proj/models/sorted_result_model.dart';

SortedResultModel quickSort({required List<int> numbers, required bool isAscending}) {
  List<int> sortedList = List.from(numbers);
  int n = sortedList.length;

  int partition(int low, int high) {
    int pivot = sortedList[high];
    int i = low - 1;

    for (int j = low; j < high; j++) {
      if (isAscending) {
        if (sortedList[j] < pivot) {
          i++;
          int temp = sortedList[i];
          sortedList[i] = sortedList[j];
          sortedList[j] = temp;
        }
      } else {
        if (sortedList[j] > pivot) {
          i++;
          int temp = sortedList[i];
          sortedList[i] = sortedList[j];
          sortedList[j] = temp;
        }
      }
    }
    int temp = sortedList[i + 1];
    sortedList[i + 1] = sortedList[high];
    sortedList[high] = temp;
    return i + 1;
  }

  void quickSortHelper(int low, int high) {
    if (low < high) {
      int pi = partition(low, high);
      quickSortHelper(low, pi - 1);
      quickSortHelper(pi + 1, high);
    }
  }

  quickSortHelper(0, n - 1);
  return SortedResultModel(sortedList: sortedList, name: 'Quick Sort');
}
