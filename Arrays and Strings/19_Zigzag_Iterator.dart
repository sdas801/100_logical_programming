class RoundRobinIterator {
  List<List<int>> lists;
  List<List<int>> queue = [];

  RoundRobinIterator(this.lists) {
    for (int i = 0; i < lists.length; i++) {
      if (lists[i].isNotEmpty) {
        queue.add([i, 0]); // [list index, next position]
      }
    }
  }

  bool hasNext() {
    return queue.isNotEmpty;
  }

  int next() {
    List<int> front = queue.removeAt(0);
    int listIndex = front[0];
    int pos = front[1];
    int value = lists[listIndex][pos];

    if (pos + 1 < lists[listIndex].length) {
      queue.add([listIndex, pos + 1]);
    }

    return value;
  }
}

void main() {
  List<List<int>> input = [
    [1, 2],
    [3, 4, 5, 6],
    [7],
  ];

  RoundRobinIterator it = RoundRobinIterator(input);
  while (it.hasNext()) {
    print(it.next());
  }
}
