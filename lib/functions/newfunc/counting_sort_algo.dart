import 'dart:io';

void main() {
  stdout.write('Enter numbers separated by spaces: ');
  List<int> numbers = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  List<int> sortedList = countingSort(numbers);

  print('Sorted list: $sortedList');
}

List<int> countingSort(List<int> numbers) {
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

  void performCountingSort(List<int> arr, int n) {
    int m = getMax(arr, n);

    for (int exp = 1; m ~/ exp > 0; exp *= 10) {
      countingSortHelper(arr, n, exp);
    }
  }

  performCountingSort(sortedList, n);

  return sortedList;
}
