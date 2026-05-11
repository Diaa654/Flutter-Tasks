void main() {
  print('--- Part 1: Manage Student Names ---');

  Set<String> students = {};
  void addStudent(String name) {
    students.add(name);
  }

  addStudent('Ahmed');
  addStudent('Mohamed');
  addStudent('Ali');

  void printStudents(List<String> studentsList, int index) {
    if (index >= studentsList.length) {
      return;
    }
    print(studentsList[index]);
    printStudents(studentsList, index + 1);
  }

  print('1. Printing recursively:');
  printStudents(students.toList(), 0);

  print('\n2. Printing with forEach and Lambda expression:');
  students.forEach((student) => print(student));

  Set<String> newStudents = {'Khalid', 'Omar'};
  Set<String> mergedStudents = {...students, ...newStudents};
  print('\n3. Merged Students using Spread Operator:');
  print(mergedStudents);

  print('\n----------------------------------------\n');
  print('--- Part 2: Manage Student Courses ---');

  Map<String, List<double>> studentGrades = {};

  void addCourse(String studentName, String courseName, [double grade = 0]) {
    if (!studentGrades.containsKey(studentName)) {
      studentGrades[studentName] = [];
    }
    studentGrades[studentName]!.add(grade);
    print('Added course "$courseName" for $studentName with grade: $grade');
  }

  addCourse('Ahmed', 'Math', 90);
  addCourse('Ahmed', 'Physics', 85);
  addCourse('Ahmed', 'History', 85);

  double averageGrade(String studentName) {
    if (!studentGrades.containsKey(studentName) ||
        studentGrades[studentName]!.isEmpty) {
      return 0.0;
    }

    List<double> grades = studentGrades[studentName]!;
    double sum = grades.fold(0.0, (prev, element) => prev + element);
    return sum / grades.length;
  }

  print('\nGrades list for Ahmed: ${studentGrades['Ahmed']}');
  print('Average grade for Ahmed: ${averageGrade('Ahmed')}');
}
