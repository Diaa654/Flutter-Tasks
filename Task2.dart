import 'dart:io';

void main() {
  print('Student Grades Manager');
  print('========================');

  final studentNames = <String>[];
  final studentGrades = <List<double>>[];

  final numberOfStudents = readPositiveInt('Enter the number of students: ');

  for (var i = 0; i < numberOfStudents; i++) {
    print('\nStudent ${i + 1}');
    final name = readStudentName('Enter student name: ');
    final subjectCount = readPositiveInt(
      'Enter the number of subjects for $name: ',
    );

    final grades = <double>[];
    for (var j = 0; j < subjectCount; j++) {
      final grade = readDoubleInRange(
        'Enter grade for subject ${j + 1} (0-100): ',
        0,
        100,
      );
      grades.add(grade);
    }

    studentNames.add(name);
    studentGrades.add(grades);
  }

  while (true) {
    print('\nMenu');
    print('1. Show All Results');
    print('2. Search Student');
    print('3. Exit');

    final choice = readNonEmptyString('Select an option (1-3): ');

    switch (choice) {
      case '1':
        showAllResults(studentNames, studentGrades);
        break;
      case '2':
        searchStudent(studentNames, studentGrades);
        break;
      case '3':
        print('Exiting program. Goodbye!');
        return;
      default:
        print('Invalid option. Please enter 1, 2, or 3.');
    }
  }
}

String readNonEmptyString(String prompt) {
  while (true) {
    stdout.write(prompt);
    final input = stdin.readLineSync()?.trim() ?? '';
    if (input.isNotEmpty) {
      return input;
    }
    print('Input cannot be empty. Please try again.');
  }
}

String readStudentName(String prompt) {
  while (true) {
    stdout.write(prompt);
    final input = stdin.readLineSync()?.trim() ?? '';
    final isValidName = RegExp(r'^[A-Za-z ]+$').hasMatch(input);

    if (input.isEmpty) {
      print('Name cannot be empty. Please try again.');
    } else if (!isValidName) {
      print('Name must contain letters only. Please try again.');
    } else {
      return input;
    }
  }
}

int readPositiveInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    final input = stdin.readLineSync()?.trim() ?? '';
    final number = int.tryParse(input);
    if (number != null && number > 0) {
      return number;
    }
    print('Please enter a valid positive integer.');
  }
}

double readDoubleInRange(String prompt, double min, double max) {
  while (true) {
    stdout.write(prompt);
    final input = stdin.readLineSync()?.trim() ?? '';
    final number = double.tryParse(input);
    if (number != null && number >= min && number <= max) {
      return number;
    }
    print('Please enter a valid number between $min and $max.');
  }
}

void showAllResults(List<String> names, List<List<double>> gradesTable) {
  if (names.isEmpty) {
    print('No student data available.');
    return;
  }

  print('\nAll Results:');
  for (var i = 0; i < names.length; i++) {
    final name = names[i].toUpperCase();
    final average = calculateAverage(gradesTable[i]);
    final letter = letterGrade(average);
    print(
      'Name: $name | Average: ${average.toStringAsFixed(2)} | Letter: $letter',
    );
  }
}

void searchStudent(List<String> names, List<List<double>> gradesTable) {
  final query = readNonEmptyString('Enter student name to search: ');
  final index = names.indexWhere(
    (name) => name.toLowerCase() == query.toLowerCase(),
  );

  if (index == -1) {
    print('Student "$query" not found.');
    return;
  }

  final average = calculateAverage(gradesTable[index]);
  print('Student: ${names[index]}');
  print('Average grade (rounded): ${average.round()}');
}

double calculateAverage(List<double> grades) {
  if (grades.isEmpty) return 0.0;
  final sum = grades.reduce((value, element) => value + element);
  return sum / grades.length;
}

String letterGrade(double average) {
  if (average >= 90) return 'A';
  if (average >= 80) return 'B';
  if (average >= 70) return 'C';
  return 'F';
}
