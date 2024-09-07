import 'dart:io';

void main() {
  stdout.write('Enter numbers separated by spaces: ');
  List<int> numbers = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  stdout.write('Enter the number to search: ');
  int searchElement = int.parse(stdin.readLineSync()!);

  binarySearch(numbers, searchElement);
}

void binarySearch(List<int> numbers, int searchElement) {
  List<int> indexes = [];
  numbers.sort((a, b) => a.compareTo(b));

  int start = 0;
  int end = numbers.length - 1;

  while (start <= end) {
    int mid = (start + end) ~/ 2;

    if (numbers[mid] == searchElement) {
      indexes.add(mid);
      break;
    } else if (numbers[mid] < searchElement) {
      start = mid + 1;
    } else {
      end = mid - 1;
    }
  }

  if (indexes.isEmpty) {
    print('Element $searchElement not found.');
  } else {
    print('Element $searchElement found at index(es): $indexes');
  }
}
