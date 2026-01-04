List<int> checkOverlap(List<List<int>> intervals) {
  List<List<int>> list = [];
  int i = 0;
  while (i < intervals.length) {
    list.add([intervals[i][0], intervals[i][1], i]);
    i = i + 1;
  }
  list.sort((List<int> a, List<int> b) => a[0] - b[0]);
  int j = 0;
  while (j < list.length - 1) {
    if (list[j + 1][0] < list[j][1]) {
      return [list[j][2], list[j + 1][2]];
    }
    j = j + 1;
  }
  return [];
}

void main() {
  List<List<int>> input = [
    [0, 30],
    [30, 60],
    [50, 70],
  ];
  List<int> out = checkOverlap(input);
  if (out.isEmpty) {
    print(false);
  } else {
    print(true);
    print(out);
  }
}
