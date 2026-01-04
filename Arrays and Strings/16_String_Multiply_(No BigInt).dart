String multiplyStrings(String num1, String num2) {
  int m = num1.length;
  int n = num2.length;
  List<int> result = List.filled(m + n, 0);

  for (int i = m - 1; i >= 0; i--) {
    int a = num1[i].codeUnitAt(0) - 48;
    for (int j = n - 1; j >= 0; j--) {
      int b = num2[j].codeUnitAt(0) - 48;
      int sum = a * b + result[i + j + 1];
      result[i + j + 1] = sum % 10;
      result[i + j] += sum ~/ 10;
    }
  }

  StringBuffer sb = StringBuffer();
  bool leadingZero = true;
  for (int digit in result) {
    if (digit == 0 && leadingZero) continue;
    leadingZero = false;
    sb.write(digit);
  }

  return sb.isEmpty ? '0' : sb.toString();
}

void main() {
  String num1 = '123';
  String num2 = '45';
  String out = multiplyStrings(num1, num2);
  print(out);
}
