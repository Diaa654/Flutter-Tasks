import 'dart:math';

void main() {
  var random = Random();
  int degree = random.nextInt(101);
  String grade;

  if (degree >= 95) {
    grade = '+A';
  } else if (degree >= 90) {
    grade = '-A';
  } else if (degree >= 85) {
    grade = '+B';
  } else if (degree >= 80) {
    grade = '-B';
  } else if (degree >= 75) {
    grade = '+C';
  } else if (degree >= 70) {
    grade = '-C';
  } else if (degree >= 65) {
    grade = '+D';
  } else if (degree >= 60) {
    grade = '-D';
  } else {
    grade = 'F';
  }

  print('Degree: $degree');
  print('Grade: $grade');
}
