import 'package:search_alog_proj/models/sorted_result_model.dart';

SortedResultModel mergeSort({required List<int> numbers, required bool isAscending}) {
  List<int> sortedList = List.from(numbers);
  int n = sortedList.length;

  void merge(int l, int m, int r) {
    int n1 = m - l + 1;
    int n2 = r - m;

    List<int> L = List.filled(n1, 0);
    List<int> R = List.filled(n2, 0);

    for (int i = 0; i < n1; i++) {
      L[i] = sortedList[l + i];
    }
    for (int j = 0; j < n2; j++) {
      R[j] = sortedList[m + 1 + j];
    }

    int i = 0, j = 0;
    int k = l;

    while (i < n1 && j < n2) {
      if (isAscending) {
        if (L[i] <= R[j]) {
          sortedList[k] = L[i];
          i++;
        } else {
          sortedList[k] = R[j];
          j++;
        }
      } else {
        if (L[i] >= R[j]) {
          sortedList[k] = L[i];
          i++;
        } else {
          sortedList[k] = R[j];
          j++;
        }
      }
      k++;
    }

    while (i < n1) {
      sortedList[k] = L[i];
      i++;
      k++;
    }

    while (j < n2) {
      sortedList[k] = R[j];
      j++;
      k++;
    }
  }

  void mergeSortHelper(int l, int r) {
    if (l < r) {
      int m = (l + r) ~/ 2;
      mergeSortHelper(l, m);
      mergeSortHelper(m + 1, r);
      merge(l, m, r);
    }
  }

  mergeSortHelper(0, n - 1);
  return SortedResultModel(sortedList: sortedList, name: 'Merge Sort');
}
