import 'package:search_alog_proj/models/sorted_result_model.dart';

SortedResultModel bubbleSort({required List<int> numbers, required bool isAscending}) {
  List<int> sortedList = List.from(numbers);
  int n = sortedList.length;

  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (isAscending) {
        if (sortedList[j] > sortedList[j + 1]) {
          int temp = sortedList[j];
          sortedList[j] = sortedList[j + 1];
          sortedList[j + 1] = temp;
        }
      } else {
        if (sortedList[j] < sortedList[j + 1]) {
          int temp = sortedList[j];
          sortedList[j] = sortedList[j + 1];
          sortedList[j + 1] = temp;
        }
      }
    }
  }
  return SortedResultModel(sortedList: sortedList, name: 'Bubble Sort');
}
