import 'package:http/http.dart';

class Api {
  final String baseUrl = 'https://hamon-interviewapi.herokuapp.com/';
  final String key = 'FaEAf';

  Future<Response> fetchStudents() async {
    var res = await get(Uri.parse(baseUrl + 'students/?api_key=' + key));
    return res;
  }

  Future<Response> fetchSubjects() async {
    var res = await get(Uri.parse(baseUrl + 'subjects/?api_key=' + key));
    return res;
  }

  Future<Response> fetchClassrooms() async {
    var res = await get(Uri.parse(baseUrl + 'classrooms/?api_key=' + key));
    return res;
  }

  Future<Response> fetchClassroom(int id) async {
    var res = await get(
        Uri.parse(baseUrl + 'classrooms/' + id.toString() + '?api_key=' + key));

    return res;
  }

  Future<Response> fetchStudent(int id) async {
    var res = await get(
        Uri.parse(baseUrl + 'students/' + id.toString() + '?api_key=' + key));

    return res;
  }

  Future<Response> fetchSubject(int id) async {
    var res = await get(
        Uri.parse(baseUrl + 'subjects/' + id.toString() + '?api_key=' + key));

    return res;
  }

  Future<Response> assignSubject(int subjectId, int classroomId) async {
    var res = await patch(
        Uri.parse(baseUrl +
            'classrooms/' +
            classroomId.toString() +
            '?api_key=' +
            key),
        body: {
          'subject': subjectId.toString(),
        });
    return res;
  }
}
