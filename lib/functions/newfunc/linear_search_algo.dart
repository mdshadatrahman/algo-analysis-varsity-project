import 'dart:io';

void main() {
  stdout.write('Enter numbers separated by spaces: ');
  List<int> numbers = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  stdout.write('Enter the number to search: ');
  int searchElement = int.parse(stdin.readLineSync()!);

  linearSearch(numbers, searchElement);
}

void linearSearch(List<int> numbers, int searchElement) {
  List<int> indexes = [];

  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] == searchElement) {
      indexes.add(i);
    }
  }

  if (indexes.isEmpty) {
    print('Element $searchElement not found.');
  } else if (indexes.length > 1) {
    print('Element $searchElement found at multiple indexes: $indexes');
  } else {
    print('Element $searchElement found at index: ${indexes.first}');
  }
}
