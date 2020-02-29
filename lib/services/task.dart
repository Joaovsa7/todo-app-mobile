import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/task.dart';

class TaskService {
  Future<List<TasksModel>> getTasksOfUser(String id) async {
    if (id == null) return null;
    String url = 'http://10.0.2.2:4000/task/user/$id';
    Map headers = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    return http.get(url, headers: headers).then((data) {
      var result = json.decode(data.body);
      var tasks = result["tasks"];
      List<TasksModel> tasksList = [];
      for (var t in tasks) {
        TasksModel task = TasksModel.fromJson(t);
        tasksList.add(task);
      }

      return tasksList;
    }).catchError((error) {
      print(error);
      return error;
    });
  }
}
