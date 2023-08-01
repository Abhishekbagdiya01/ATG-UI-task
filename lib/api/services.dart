import 'dart:convert';

import 'package:atg_task_1/models/lesson_model.dart';
import 'package:atg_task_1/models/program_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const lessonsUrl =
      "https://632017e19f82827dcf24a655.mockapi.io/api/lessons";
  static const programsUrl =
      "https://632017e19f82827dcf24a655.mockapi.io/api/programs";

  Future<ProgramModel> fetchPrograms() async {
    final response = await http.get(Uri.parse(programsUrl));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print(body);
      return ProgramModel.fromJson(body);
    } else {
      return ProgramModel();
    }
  }

  Future<LessonModel> fetchLessons() async {
    final response = await http.get(Uri.parse(lessonsUrl));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print(body);
      return LessonModel.fromJson(body);
    } else {
      return LessonModel();
    }
  }
}
