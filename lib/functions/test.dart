void merge(List<int> arr, int s, int e) {
  int mid = ((s + e) / 2).floor();
  int len1 = mid - s + 1;
  int len2 = e - mid;

  List<int> first = [];
  List<int> second = [];

  // copy values
  int mainArrayIndex = s;
  for (int i = 0; i < len1; i++) {
    // first[i] = arr[mainArrayIndex++];
    first.add(arr[mainArrayIndex++]);
  }

  mainArrayIndex = mid + 1;
  for (int i = 0; i < len2; i++) {
    // second[i] = arr[mainArrayIndex++];
    second.add(arr[mainArrayIndex++]);
  }

  // merge 2 sorted array
  int index1 = 0;
  int index2 = 0;
  mainArrayIndex = s;

  while (index1 < len1 && index2 < len2) {
    if (first[index1] < second[index2]) {
      arr[mainArrayIndex++] = first[index1++];
    } else {
      arr[mainArrayIndex++] = second[index2++];
    }
  }

  while (index1 < len1) {
    arr[mainArrayIndex++] = first[index1++];
  }
  while (index2 < len2) {
    arr[mainArrayIndex++] = second[index2++];
  }
}

void mergeSort(List<int> arr, int s, int e) {
  // base case
  if (s >= e) {
    return;
  }

  int mid = ((s + e) / 2).floor();

  // sort left part
  mergeSort(arr, s, mid);

  // sort right part
  mergeSort(arr, mid + 1, e);

  // merge
  merge(arr, s, e);
}

void main() {
  List<int> arr = [2, 5, 1, 6, 9];
  int n = 5;
  mergeSort(arr, 0, n - 1);
  print(arr);
}
