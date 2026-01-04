String? normalizeEmail(String s) {
  String t = s.trim();
  List<String> a = t.split('@');
  if (a.length != 2) return null;
  String local = a[0];
  String domain = a[1];
  if (local.isEmpty || domain.isEmpty) return null;
  if (!domain.contains('.')) return null;
  if (domain.startsWith('.') || domain.endsWith('.')) return null;
  String d = domain.toLowerCase();
  // String l = local.toLowerCase();

  return local + '@' + d;
}

void main() {
  String input = ' John.Doe@Example.COM ';
  String? out = normalizeEmail(input);
  print(out);
}
