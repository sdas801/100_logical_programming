int nextRand(int seed) {
  int a = 1103515245;
  int c = 12345;
  int m = 2147483647;
  return (a * seed + c) % m;
}

List<int> shuffle(List<int> arr, int seed) {
  List<int> list = List<int>.from(arr);
  int i = list.length - 1;
  int currentSeed = seed;
  while (i > 0) {
    currentSeed = nextRand(currentSeed);
    int j = currentSeed % (i + 1);
    int temp = list[i];
    list[i] = list[j];
    list[j] = temp;
    i = i - 1;
  }
  return list;
}

void main() {
  List<int> input = [1, 2, 3, 4];
  int seed = 7;
  List<int> out = shuffle(input, seed);
  print(out);
}
