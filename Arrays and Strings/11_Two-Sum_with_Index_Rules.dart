List<int> twoSum(List<int> nums, int target) {
  Map<int, int> map = {};
  int bestI = -1;
  int bestJ = 1000000000;
  int i = 0;
  while (i < nums.length) {
    int need = target - nums[i];
    if (map.containsKey(need)) {
      int j = i;
      int ii = map[need]!;
      if (j < bestJ || (j == bestJ && ii < bestI)) {
        bestI = ii;
        bestJ = j;
      }
    }
    if (!map.containsKey(nums[i])) {
      map[nums[i]] = i;
    }
    i = i + 1;
  }
  if (bestI == -1) return [];
  return [bestI, bestJ];
}

void main() {
  List<int> nums = [2, 7, 11, 15, 7];
  int target = 9;
  List<int> out = twoSum(nums, target);
  print(out);
}
