import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/api/api.dart';
import 'package:hamon_interviewapi/models/classroom_model.dart';

class ClassroomProvider extends ChangeNotifier {
  final Api api;

  ClassroomProvider(this.api);
  List<ClassroomModel> _classroomsDetails = [];
  bool _isLoading = false;
  

  List<ClassroomModel> get classroomsDetails => _classroomsDetails;
  bool get isLoading => _isLoading;
  fetchClassrooms() async {
    if (_classroomsDetails.isNotEmpty) {
      return;
    }
    _isLoading = true;
    var res = await api.fetchClassrooms();

    if (res.statusCode == 200) {
      var decoded = jsonDecode(res.body);

      _classroomsDetails = decoded['classrooms']
          .map<ClassroomModel>((e) => ClassroomModel.fromMap(e))
          .toList();

      _isLoading = false;

      notifyListeners();
    } else {

      //1111
      _isLoading = false;

    }
  }
}