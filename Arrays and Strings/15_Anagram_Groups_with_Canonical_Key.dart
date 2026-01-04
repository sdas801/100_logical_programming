List<List<String>> groupAnagrams(List<String> words) {
  Map<String, List<int>> map = {};
  int i = 0;
  while (i < words.length) {
    List<String> chars = words[i].split('');
    chars.sort();
    String key = chars.join();
    if (!map.containsKey(key)) {
      map[key] = [];
    }
    map[key]!.add(i);
    i = i + 1;
  }
  List<List<int>> groups = [];
  map.forEach((String k, List<int> v) {
    groups.add(v);
  });
  groups.sort((List<int> a, List<int> b) {
    if (b.length != a.length) {
      return b.length - a.length;
    }
    return a[0] - b[0];
  });
  List<List<String>> result = [];
  int j = 0;
  while (j < groups.length) {
    List<String> g = [];
    int k = 0;
    while (k < groups[j].length) {
      g.add(words[groups[j][k]]);
      k = k + 1;
    }
    result.add(g);
    j = j + 1;
  }
  return result;
}

void main() {
  List<String> input = ['eat', 'tea', 'tan', 'ate', 'nat', 'bat'];
  List<List<String>> out = groupAnagrams(input);
  print(out);
}
