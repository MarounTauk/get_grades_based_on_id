import 'dart:convert';
import 'package:http/http.dart' as http;
import 'student_grade.dart';

Future<List<StudentGrade>> getStudentGrades(String studentId) async {

  final url = Uri.parse(
      'http://10.0.2.2:8080/Maroun_Naji_phppart/get_student_grades.php?student_id=$studentId');
//http://localhost:8080/Maroun_Naji_phppart/get_student_grades.php?student_id=
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => StudentGrade.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load student grades');
  }
}