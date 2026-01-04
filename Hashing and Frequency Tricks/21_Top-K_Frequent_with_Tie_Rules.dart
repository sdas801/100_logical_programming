List<int> topKFrequent(List<int> nums, int k) {
  Map<int, int> freq = {};
  for (int num in nums) {
    freq[num] = (freq[num] ?? 0) + 1;
  }

  List<List<int>> pairs = [];
  freq.forEach((num, f) => pairs.add([num, f]));

  pairs.sort((a, b) {
    if (b[1] != a[1]) return b[1] - a[1];
    return a[0] - b[0];
  });

  List<int> result = [];
  for (int i = 0; i < k; i++) {
    result.add(pairs[i][0]);
  }

  return result;
}

void main() {
  List<int> nums = [1, 1, 1, 2, 2, 3];
  int k = 2;
  List<int> out = topKFrequent(nums, k);
  print(out);
}
