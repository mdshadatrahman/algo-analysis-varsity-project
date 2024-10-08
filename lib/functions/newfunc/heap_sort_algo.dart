import 'dart:io';

void main() {
  stdout.write('Enter numbers separated by spaces: ');
  List<int> numbers = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  List<int> sortedList = heapSort(numbers);

  print('Sorted list: $sortedList');
}

List<int> heapSort(List<int> numbers) {
  List<int> sortedList = List.from(numbers);
  int n = sortedList.length;

  void heapify(List<int> arr, int n, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && arr[left] > arr[largest]) {
      largest = left;
    }

    if (right < n && arr[right] > arr[largest]) {
      largest = right;
    }

    if (largest != i) {
      int swap = arr[i];
      arr[i] = arr[largest];
      arr[largest] = swap;

      heapify(arr, n, largest);
    }
  }

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(sortedList, n, i);
  }

  for (int i = n - 1; i >= 0; i--) {
    int temp = sortedList[0];
    sortedList[0] = sortedList[i];
    sortedList[i] = temp;

    heapify(sortedList, i, 0);
  }

  return sortedList;
}
