import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/models/user.dart';
import 'dart:convert';

class UserService {
  String apiUrl = DotEnv().env['API_LOCAL'];
  Future<LoginResponse> login(String email, String password) async {
    String url = '$apiUrl/user/login';
    Map headers = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    Map userRequest = {
      'user': {
        'email': email,
        'password': password,
      }
    };

    return http
        .post(url, headers: headers, body: jsonEncode(userRequest))
        .then((data) {
      var jsonData = jsonDecode(data.body);
      LoginResponse parsedData = LoginResponse.fromJson(jsonData);
      return parsedData;
    }).catchError((error) {
      print("catch error");
      print(error);
      return LoginResponse(error: error);
    });
  }

  Future<LoginResponse> register(Map data) async {
    String url = '$apiUrl/user/register';
    Map headers = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    Map userData = {"user": data};

    return http
        .post(url, headers: headers, body: jsonEncode(userData))
        .then((data) {
      var jsonData = jsonDecode(data.body);
      LoginResponse parsedData = LoginResponse.fromJson(jsonData);
      return parsedData;
    }).catchError((error) {
      print("catch error");
      print(error);
      return LoginResponse(error: error);
    });
  }
}
