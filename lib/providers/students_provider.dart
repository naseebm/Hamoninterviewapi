import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/api/api.dart';
import 'package:hamon_interviewapi/models/student_model.dart';

class StudentsProvider extends ChangeNotifier {
  final Api api;

  StudentsProvider(this.api);
  List<StudentModel> _studentsDetails = [];
  bool _isLoading = false;

  List<StudentModel> get studentsDetails => _studentsDetails;
  bool get isLoading => _isLoading;

  fetchStudents() async {
    if (_studentsDetails.isNotEmpty) {
      return;
    }
    _isLoading = true;
    var res = await api.fetchStudents();

    if (res.statusCode == 200) {
      var decoded = jsonDecode(res.body);

      _studentsDetails = decoded['students']
          .map<StudentModel>((e) => StudentModel.fromMap(e))
          .toList();

      _isLoading = false;

      notifyListeners();
    } else {
      _isLoading = false;
    }
  }
}
