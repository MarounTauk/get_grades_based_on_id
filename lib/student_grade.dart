class StudentGrade {
  final String studentId;
  final String name;
  final String subjectCode;
  final String subjectName;
  final String grade;

  StudentGrade({
    required this.studentId,
    required this.name,
    required this.subjectCode,
    required this.subjectName,
    required this.grade,
  });

  factory StudentGrade.fromJson(Map<String, dynamic> json) {
    return StudentGrade(
      studentId: json['student_id'],
      name: json['name'],
      subjectCode: json['subject_code'],
      subjectName: json['subject_name'],
      grade: json['grade'],
    );
  }
}