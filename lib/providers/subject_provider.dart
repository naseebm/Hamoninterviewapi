import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hamon_interviewapi/api/api.dart';
import 'package:hamon_interviewapi/models/subject_model.dart';

class SubjectProvider extends ChangeNotifier {

  final Api api;

  SubjectProvider(this.api);
  List<SubjectModel> _subjectsDetails = [];
  bool _isLoading = false;

  List<SubjectModel> get subjectssDetails => _subjectsDetails;
  bool get isLoading => _isLoading;

  fetchSubjects() async {
    if (_subjectsDetails.isNotEmpty) {
      return;
    }
    _isLoading = true;
    var res = await api.fetchSubjects();

    if (res.statusCode == 200) {
      var decoded = jsonDecode(res.body);

      _subjectsDetails = decoded['subjects']
          .map<SubjectModel>((e) => SubjectModel.fromMap(e))
          .toList();

      _isLoading = false;

      notifyListeners();
    } else {_isLoading = false;}
  }
  
}