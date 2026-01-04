int longestConsecutive(List<int> nums) {
  Set<int> numSet = nums.toSet();
  int longest = 0;

  for (int num in numSet) {
    if (!numSet.contains(num - 1)) {
      int current = num;
      int length = 1;
      while (numSet.contains(current + 1)) {
        current += 1;
        length += 1;
      }
      if (length > longest) longest = length;
    }
  }

  return longest;
}

void main() {
  List<int> nums = [100, 4, 200, 1, 3, 2];
  int out = longestConsecutive(nums);
  print(out);
}
