import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/providers/classrooms_provider.dart';
import 'package:hamon_interviewapi/providers/students_provider.dart';
import 'package:hamon_interviewapi/providers/subject_provider.dart';
import 'package:hamon_interviewapi/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'api/api.dart';

void main() {
  final api = Api();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<StudentsProvider>(
          create: (_) => StudentsProvider(api)),
      ChangeNotifierProvider<SubjectProvider>(
          create: (_) => SubjectProvider(api)),
      ChangeNotifierProvider<ClassroomProvider>(
          create: (_) => ClassroomProvider(api)),
    ],
    child:const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamon interview app',
      theme: ThemeData(
           primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
    );
  }
}
