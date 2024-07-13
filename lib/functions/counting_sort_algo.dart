import 'package:search_alog_proj/models/sorted_result_model.dart';

SortedResultModel coutingSort({required List<int> numbers}) {
  List<int> sortedList = List.from(numbers);
  int n = sortedList.length;

  void countingSortHelper(List<int> arr, int n, int k) {
    List<int> output = List.filled(n, 0);
    List<int> count = List.filled(10, 0);

    for (int i = 0; i < n; i++) {
      count[(arr[i] ~/ k) % 10]++;
    }

    for (int i = 1; i < 10; i++) {
      count[i] += count[i - 1];
    }

    for (int i = n - 1; i >= 0; i--) {
      output[count[(arr[i] ~/ k) % 10] - 1] = arr[i];
      count[(arr[i] ~/ k) % 10]--;
    }

    for (int i = 0; i < n; i++) {
      arr[i] = output[i];
    }
  }

  int getMax(List<int> arr, int n) {
    int mx = arr[0];
    for (int i = 1; i < n; i++) {
      if (arr[i] > mx) {
        mx = arr[i];
      }
    }
    return mx;
  }

  void countingSort(List<int> arr, int n) {
    int m = getMax(arr, n);

    for (int exp = 1; m ~/ exp > 0; exp *= 10) {
      countingSortHelper(arr, n, exp);
    }
  }

  countingSort(sortedList, n);

  return SortedResultModel(sortedList: sortedList, name: 'Counting Sort');
}
