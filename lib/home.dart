import 'package:flutter/material.dart';
import 'student_grade.dart';
import 'fetch_grades.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<StudentGrade> grades = [];
  bool isLoading = false;
  String errorMessage = '';
  final TextEditingController studentIdController = TextEditingController();

  void fetchGrades() async {
    setState(() {
      isLoading = true;
      errorMessage = '';0
    });

    try {
      List<StudentGrade> result =
      await getStudentGrades(studentIdController.text);
      setState(() {
        grades = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Grades'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: studentIdController,
              decoration: InputDecoration(
                labelText: 'Enter Student ID',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: fetchGrades,
            child: Text('Fetch Grades'),
          ),
          if (isLoading)
            Center(child: CircularProgressIndicator())
          else if (errorMessage.isNotEmpty)
            Center(
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            )
          else if (grades.isEmpty)
              Center(child: Text('No grades found')),
          if (grades.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: grades.length,ectName} (${grade.subjectCode})'),
                    subtitle: Text('Grade: ${grade.grade}'),
                    trailing: Text(grade.name),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}