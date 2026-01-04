String decodeString(String s) {
  List<int> countStack = [];
  List<String> stringStack = [];
  String current = '';
  int k = 0;

  for (int i = 0; i < s.length; i++) {
    String c = s[i];
    if (c.codeUnitAt(0) >= 48 && c.codeUnitAt(0) <= 57) {
      k = k * 10 + int.parse(c);
    } else if (c == '[') {
      countStack.add(k);
      stringStack.add(current);
      current = '';
      k = 0;
    } else if (c == ']') {
      int repeat = countStack.removeLast();
      String prev = stringStack.removeLast();
      current = prev + current * repeat;
    } else {
      current += c;
    }
  }

  return current;
}

void main() {
  String input = '2[ab3[c]]';
  String out = decodeString(input);
  print(out);
}
