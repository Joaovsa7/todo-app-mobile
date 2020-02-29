class LoginResponse {
  User user;
  bool auth;
  String token;
  String error;

  LoginResponse({
    this.user,
    this.auth = false,
    this.token,
    this.error,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    auth = json['auth'];
    token = json['token'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['auth'] = this.auth;
    data['token'] = this.token;
    data['error'] = this.error;
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
