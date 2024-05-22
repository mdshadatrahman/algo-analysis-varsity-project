import 'package:search_alog_proj/models/search_result_model.dart';

SearchResultModel linearSearch(List<int> numbers, int searchElement) {
  List<int> indexes = [];

  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] == searchElement) {
      indexes.add(i);
    }
  }
  if (indexes.isEmpty) {
    return SearchResultModel(
      found: false,
      searchElement: searchElement,
    );
  } else if (indexes.length > 1) {
    return SearchResultModel(
      found: true,
      searchElement: searchElement,
      hasMultiple: true,
      indexes: indexes,
    );
  } else {
    return SearchResultModel(
      found: true,
      indexes: indexes,
      searchElement: searchElement,
    );
  }
}
