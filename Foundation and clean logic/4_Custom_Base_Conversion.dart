String encode(int n, String alphabet) {
  if (n == 0) return alphabet[0];
  int base = alphabet.length;
  String result = '';
  int num = n;
  while (num > 0) {
    int r = num % base;
    result = alphabet[r] + result;
    num = num ~/ base;
  }
  return result;
}

int decode(String s, String alphabet) {
  int base = alphabet.length;
  Map<String, int> map = {};
  int i = 0;
  while (i < alphabet.length) {
    map[alphabet[i]] = i;
    i = i + 1;
  }
  int result = 0;
  int j = 0;
  while (j < s.length) {
    result = result * base + map[s[j]]!;
    j = j + 1;
  }
  return result;
}

void main() {
  String alphabet = '0123456789ABCDEF';
  String e = encode(255, alphabet);
  int d = decode(e, alphabet);
  print(e);
  print(d);
}
