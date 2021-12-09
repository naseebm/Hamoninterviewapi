import 'package:http/http.dart';

class Api {
  final String baseUrl = 'https://hamon-interviewapi.herokuapp.com/';
  final String key = 'FaEAf';

  Future<Response> fetchStudents() async {
    var res = await get(Uri.parse(baseUrl + 'students/?api_key=' + key));
    return res;
  }
}
