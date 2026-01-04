int findKthMissing(List<int> arr, int k) {
  int missing = 0;
  int prev = 0;
  int i = 0;
  while (i < arr.length) {
    int cur = arr[i];
    int diff = cur - prev - 1;
    if (missing + diff >= k) {
      return prev + (k - missing);
    }
    missing = missing + diff;
    prev = cur;
    i = i + 1;
  }
  return prev + (k - missing);
}

void main() {
  List<int> arr = [2, 3, 4, 7, 11];
  int k = 5;
  int out = findKthMissing(arr, k);
  print(out);
}
