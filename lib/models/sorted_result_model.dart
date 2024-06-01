class SortedResultModel {
  SortedResultModel({
    required this.name,
    required this.sortedList,
  });

  List<int> sortedList;
  String name;

  @override
  String toString() {
    return sortedList.join(', ');
  }
}
