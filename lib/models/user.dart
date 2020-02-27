class LoginResponse {
  User user;
  bool auth;
  String token;
  bool error;
  String errorMessage;

  LoginResponse({
    this.user,
    this.auth = false,
    this.token,
    this.error = false,
    this.errorMessage,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    auth = json['auth'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['auth'] = this.auth;
    data['token'] = this.token;
    return data;
  }
}

class User {
  String password;
  String createdAt;
  int status;
  String id;
  String firstName;
  String lastName;
  String email;
  int iV;

  User(
      {this.password,
      this.createdAt,
      this.status,
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    createdAt = json['createdAt'];
    status = json['status'];
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    data['_id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['__v'] = this.iV;
    return data;
  }
}

class RegisterResponse {
  String message;
  Data data;
  bool error;

  RegisterResponse({this.error, this.message, this.data});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String password;
  int status;
  String sId;
  String firstName;
  String lastName;
  String email;

  Data({
    this.password,
    this.status,
    this.sId,
    this.firstName,
    this.lastName,
    this.email,
  });

  Data.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    return data;
  }
}
