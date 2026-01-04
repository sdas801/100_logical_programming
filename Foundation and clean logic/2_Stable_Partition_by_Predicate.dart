void main() {
  List<int> result = stablePredicate([3, 1, 4, 2, 5]);
  print(result);
}

List<int> stablePredicate(List<int> list) {
  List<int> trueList = [];
  List<int> falseList = [];
  for (int i = 0; i < list.length; i++) {
    list[i].isEven ? trueList.add(list[i]) : falseList.add(list[i]);
  }
  return <int>[...trueList, ...falseList];
}
