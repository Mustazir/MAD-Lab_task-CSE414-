int remainder(int num1, int num2) {
  return num1 % num2;
}

int subtraction(int num1, int num2) {
  return num1 - num2;
}

int sum(int num1, int num2) {
  return num1 + num2;
}

void main() {
  int num1 = 15;
  int num2 = 4;

  int remainderResult = remainder(num1, num2);
  print('Remainder : $remainderResult');

  int subtractionResult = subtraction(num1, num2);
  print('Subtraction : $subtractionResult');

  int sumResult = sum(num1, num2);
  print('Sum : $sumResult');
}
