String? oneEditAway(String s1, String s2) {
  int len1 = s1.length;
  int len2 = s2.length;

  if (len1 == len2) {
    int diff = 0;
    String op = '';
    for (int i = 0; i < len1; i++) {
      if (s1[i] != s2[i]) {
        diff++;
        op = 'replace ${s1[i]} with ${s2[i]}';
      }
      if (diff > 1) return null;
    }
    return diff == 1 ? op : '';
  }

  if ((len1 - len2).abs() == 1) {
    String longer = len1 > len2 ? s1 : s2;
    String shorter = len1 > len2 ? s2 : s1;
    int i = 0, j = 0;
    String op = '';
    while (i < longer.length && j < shorter.length) {
      if (longer[i] != shorter[j]) {
        if (op.isNotEmpty) return null;
        op = len1 > len2 ? 'delete ${longer[i]}' : 'insert ${longer[i]}';
        i++;
      } else {
        i++;
        j++;
      }
    }
    if (op.isEmpty && i < longer.length) {
      op = len1 > len2 ? 'delete ${longer[i]}' : 'insert ${longer[i]}';
    }
    return op;
  }

  return null;
}

void main() {
  String s1 = 'pale';
  String s2 = 'ple';

  String? op = oneEditAway(s1, s2);
  if (op != null) {
    print(true);
    print('op = $op');
  } else {
    print(false);
  }
}
