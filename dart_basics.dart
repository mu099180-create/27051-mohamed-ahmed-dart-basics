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

String initials(String fullName) {
  // by MA
  List<String> parts = fullName.trim().split(' ');
  String result = '';
  int i = 0;
  while (i < parts.length) {
    if (parts[i].isNotEmpty) {
      result += parts[i][0].toUpperCase() + '.';
    }
    i++;
  }
  return result;
}

void drawTriangle(int height) {
  // by MA
  int row = 1;
  while (row <= height) {
    String symbol = row % 2 == 1 ? '*' : '#';
    print(' ' * (height - row) + symbol * row);
    row++;
  }
}

int momoFee(int amount) {
  // by MA
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String maskPhone(String phone) {
  // by MA
  if (phone.length != 10) {
    return 'INVALID';
  }
  return phone.substring(0, 3) +
      '*' * (phone.length - 5) +
      phone.substring(phone.length - 2);
}

void main() {
  // by MA
  print('Reg no: $regNo | D = $d | T = $t');

  String name = 'Mohamed Ahmed';
  print('$name has ${countVowels(name)} vowels');

  print(initials(name));
  print(initials(' ana uwase '));
  print("'${initials(' ')}'");

  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  String phone = '0788123456';
  int total = 0;
  int i = 1;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    total += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $total RWF');
}
