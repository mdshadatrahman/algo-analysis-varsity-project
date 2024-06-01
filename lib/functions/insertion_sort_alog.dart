import 'package:search_alog_proj/models/sorted_result_model.dart';

SortedResultModel insertionSort({required List<int> numbers, required bool isAscending}) {
  List<int> sortedList = List.from(numbers);
  int n = sortedList.length;

  for (int i = 1; i < n; i++) {
    int key = sortedList[i];
    int j = i - 1;

    while (j >= 0 && (isAscending ? sortedList[j] > key : sortedList[j] < key)) {
      sortedList[j + 1] = sortedList[j];
      j = j - 1;
    }
    sortedList[j + 1] = key;
  }
  return SortedResultModel(sortedList: sortedList, name: 'Insertion Sort');
}
