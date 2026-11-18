// Student: Mohamed Ahmed
// Reg no: 27051
const String regNo = '27051';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by MA
  String lower = text.toLowerCase();
  int count = 0;
  int i = 0;
  while (i < lower.length) {
    if ('aeiou'.contains(lower[i])) {
      count++;
    }
    i++;
  }
  return count;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  String name = 'Mohamed Ahmed';
  print('$name has ${countVowels(name)} vowels');
}
