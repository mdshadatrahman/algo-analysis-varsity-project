import 'package:search_alog_proj/models/search_result_model.dart';

SearchResultModel binarySearch(List<int> numbers, int searchElement) {
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

  return indexes.isEmpty
      ? SearchResultModel(
          found: false,
          searchElement: searchElement,
        )
      : SearchResultModel(
          found: true,
          searchElement: searchElement,
          hasMultiple: false,
          indexes: indexes,
        );
}
