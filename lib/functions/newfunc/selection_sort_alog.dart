import 'dart:io';

void main() {
  stdout.write('Enter numbers separated by spaces: ');
  List<int> numbers = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  stdout.write('Sort in ascending order? (yes/no): ');
  String sortOrder = stdin.readLineSync()!.toLowerCase();

  bool isAscending = sortOrder == 'yes';

  List<int> sortedList = selectionSort(numbers: numbers, isAscending: isAscending);

  print('Sorted list: $sortedList');
}

List<int> selectionSort({required List<int> numbers, required bool isAscending}) {
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

  return sortedList;
}
