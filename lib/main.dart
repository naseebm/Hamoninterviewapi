import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/providers/classroom_provider.dart';
import 'package:hamon_interviewapi/providers/students_provider.dart';
import 'package:hamon_interviewapi/providers/subject_provider.dart';
import 'package:hamon_interviewapi/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'api/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final api = Api();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamon interview app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<StudentsProvider>(
              create: (_) => StudentsProvider(api)),
               ChangeNotifierProvider<SubjectProvider>(
              create: (_) => SubjectProvider(api)),
              ChangeNotifierProvider<ClassroomProvider>(
              create: (_) => ClassroomProvider(api)),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}
