import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/task.dart';

class TaskService {
  String apiUrl = DotEnv().env['API_LOCAL'];
  Future<List<TasksModel>> getByUser(String id, String token) async {
    if (id == null) return null;
    String url = '$apiUrl/task/user/$id';
    Map headers = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'token': token
    };

    return http.get(url, headers: headers).then((data) {
      var result = json.decode(data.body);
      var tasks = result["tasks"];
      List<TasksModel> tasksList = [];
      if (tasks == null) {
        return tasksList;
      }

      for (var task in tasks) {
        TasksModel taskJson = TasksModel.fromJson(task);
        tasksList.add(taskJson);
      }

      return tasksList;
    }).catchError((error) {
      print(error);
      return TasksModel(error: error);
    });
  }

  Future<TasksModel> create(Map formData, String token) async {
    if (formData == null) return null;
    String url = '$apiUrl/task/create';
    Map headers = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'token': token
    };

    return http
        .post(url, headers: headers, body: json.encode(formData))
        .then((data) {
      var result = json.decode(data.body);
      return TasksModel.fromJson(result);
    }).catchError((error) {
      print(error);
      return TasksModel(error: error);
    });
  }

  Future<TasksModel> delete(String id, String token) async {
    if (id == null) return null;
    String url = '$apiUrl/task/delete/$id';
    Map headers = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'token': token
    };

    return http.post(url, headers: headers).then((data) {
      var result = json.decode(data.body);
      return TasksModel.fromJson(result);
    }).catchError((error) {
      print(error);
      return TasksModel(error: error);
    });
  }
}
