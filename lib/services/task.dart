import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/task.dart';

class TaskService {
  Future<List<TasksModel>> getByUser(String id, String token) async {
    if (id == null) return null;
    String url = 'https://backend-todo-app.herokuapp.com/task/user/$id';
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

      for (var t in tasks) {
        TasksModel task = TasksModel.fromJson(t);
        tasksList.add(task);
      }

      return tasksList;
    }).catchError((error) {
      print(error);
      return TasksModel(error: error);
    });
  }

  Future<TasksModel> create(Map formData, String token) async {
    if (formData == null) return null;
    String url = 'https://backend-todo-app.herokuapp.com/task/create';
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
    String url = 'https://backend-todo-app.herokuapp.com/task/delete/$id';
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
