List<String> subdomainVisits(List<String> cpdomains) {
  Map<String, int> countMap = {};

  for (String cp in cpdomains) {
    List<String> parts = cp.split(' ');
    int count = int.parse(parts[0]);
    String domain = parts[1];

    List<String> fragments = domain.split('.');
    for (int i = 0; i < fragments.length; i++) {
      String subdomain = fragments.sublist(i).join('.');
      countMap[subdomain] = (countMap[subdomain] ?? 0) + count;
    }
  }

  List<String> result = [];
  countMap.forEach((domain, count) {
    result.add('$count $domain');
  });

  return result;
}

void main() {
  List<String> input = ['9001 discuss.leetcode.com'];
  List<String> out = subdomainVisits(input);
  print(out);
}
