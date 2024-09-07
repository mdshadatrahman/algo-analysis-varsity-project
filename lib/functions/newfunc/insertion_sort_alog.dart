import 'dart:io';

void main() {
  stdout.write('Enter numbers separated by spaces: ');
  List<int> numbers = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  stdout.write('Sort in ascending order? (yes/no): ');
  String sortOrder = stdin.readLineSync()!.toLowerCase();

  bool isAscending = sortOrder == 'yes';

  List<int> sortedList = insertionSort(numbers: numbers, isAscending: isAscending);

  print('Sorted list: $sortedList');
}

List<int> insertionSort({required List<int> numbers, required bool isAscending}) {
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

  return sortedList;
}
