int subarraySum(List<int> nums, int k) {
  Map<int, int> prefixCount = {0: 1};
  int sum = 0;
  int count = 0;

  for (int num in nums) {
    sum += num;
    if (prefixCount.containsKey(sum - k)) {
      count += prefixCount[sum - k]!;
    }
    prefixCount[sum] = (prefixCount[sum] ?? 0) + 1;
  }

  return count;
}

void main() {
  List<int> nums = [1, 2, 3, -2, 5];
  int k = 3;
  int out = subarraySum(nums, k);
  print(out);
}
