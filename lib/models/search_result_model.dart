class SearchResultModel {
  final bool found;
  final int searchElement;
  final bool? hasMultiple;
  final List<int>? indexes;

  SearchResultModel({
    required this.found,
    required this.searchElement,
    this.hasMultiple,
    this.indexes,
  });

  @override
  String toString() {
    if (found) {
      if (hasMultiple != null && hasMultiple!) {
        return 'Found $searchElement at indexes: $indexes';
      } else {
        return 'Found $searchElement at index: ${indexes?[0]}';
      }
    } else {
      return 'Element $searchElement not found';
    }
  }
}
