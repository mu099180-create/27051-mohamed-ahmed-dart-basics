// by MA
// Student: Mohamed Ahmed
// Reg no: 27051
const String regNo = '27051';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String formatRwf(int amount) {
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

int sendMoney(int balance, int amount) {
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;

  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');

  return newBalance;
}

int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime must be from 100 to 50,000 RWF');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print('Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');

  return newBalance;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);

  balance = buyAirtime(balance, 1000);

  balance = sendMoney(balance, 0);

  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  print(formatRwf(0));
  print(formatRwf(1000));
  print(formatRwf(-5000));

  print(isValidPin('54321'));
  print(isValidPin('11111'));
}
