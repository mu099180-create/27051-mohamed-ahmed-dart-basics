// Student: Mohamed Ahmed
// Reg no: 27051
const String regNo = '27051';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by MA
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String formatRwf(int amount) {
  // by MA
  bool negative = amount < 0;
  String digits = (negative ? -amount : amount).toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    if (count > 0 && count % 3 == 0) {
      result = ',$result';
    }
    result = digits[i] + result;
    count++;
    i--;
  }
  String sign = negative ? '-' : '';
  return '$sign$result RWF';
}

bool isValidPin(String pin) {
  // by MA
  if (pin.length != 5) return false;

  int i = 0;
  while (i < pin.length) {
    int c = pin.codeUnitAt(i);
    if (c < 48 || c > 57) return false;
    i++;
  }

  if (pin == '12345') return false;

  bool allSame = true;
  i = 1;
  while (i < pin.length) {
    if (pin[i] != pin[0]) allSame = false;
    i++;
  }
  if (allSame) return false;

  return true;
}

void main() {
  // by MA
  print('Reg no: $regNo | D = $d | T = $t');
  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));
}
