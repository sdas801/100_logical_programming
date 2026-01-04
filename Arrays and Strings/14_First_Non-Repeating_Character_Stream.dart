List<String> firstNonRepeating(List<String> stream) {
  List<int> freq = List<int>.filled(26, 0);
  List<String> queue = [];
  List<String> result = [];
  int i = 0;
  while (i < stream.length) {
    String c = stream[i];
    int idx = c.codeUnitAt(0) - 97;
    freq[idx] = freq[idx] + 1;
    queue.add(c);
    while (queue.isNotEmpty && freq[queue[0].codeUnitAt(0) - 97] > 1) {
      queue.removeAt(0);
    }
    if (queue.isEmpty) {
      result.add('#');
    } else {
      result.add(queue[0]);
    }
    i = i + 1;
  }
  return result;
}

void main() {
  List<String> input = ['a', 'a', 'b', 'c', 'b'];
  List<String> out = firstNonRepeating(input);
  print(out);
}
