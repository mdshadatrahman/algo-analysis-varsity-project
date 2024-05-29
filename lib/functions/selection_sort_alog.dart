import 'package:search_alog_proj/models/sorted_result_model.dart';

SortedResultModel selectionSort({required List<int> numbers, required bool isAscending}) {
  List<int> sortedList = List.from(numbers);
  int n = sortedList.length;

  for (int i = 0; i < n - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < n; j++) {
      if (isAscending) {
        if (sortedList[j] < sortedList[minIndex]) {
          minIndex = j;
        }
      } else {
        if (sortedList[j] > sortedList[minIndex]) {
          minIndex = j;
        }
      }
    }
    int temp = sortedList[minIndex];
    sortedList[minIndex] = sortedList[i];
    sortedList[i] = temp;
  }
  return SortedResultModel(sortedList: sortedList);
}
