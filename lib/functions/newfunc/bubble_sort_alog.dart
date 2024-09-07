import 'dart:io';

void main() {
  stdout.write('Enter numbers separated by spaces: ');
  List<int> numbers = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  stdout.write('Sort in ascending order? (yes/no): ');
  String sortOrder = stdin.readLineSync()!.toLowerCase();

  bool isAscending = sortOrder == 'yes';

  List<int> sortedList = bubbleSort(numbers: numbers, isAscending: isAscending);

  print('Sorted list: $sortedList');
}

List<int> bubbleSort({required List<int> numbers, required bool isAscending}) {
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

  return sortedList;
}
