class TasksModel {
  bool done;
  String createdAt;
  int status;
  String id;
  String title;
  String description;
  String userId;
  int iV;
  bool error;
  String errorMessage;
  String successMessage;

  TasksModel(
      {this.done,
      this.createdAt,
      this.status,
      this.id,
      this.title,
      this.description,
      this.userId,
      this.iV,
      this.error,
      this.errorMessage,
      this.successMessage});

  TasksModel.fromJson(Map<String, dynamic> json) {
    done = json['done'];
    createdAt = json['createdAt'];
    status = json['status'];
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    userId = json['user_id'];
    iV = json['__v'];
    successMessage = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['done'] = this.done;
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    data['_id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['user_id'] = this.userId;
    data['__v'] = this.iV;
    data['error'] = this.errorMessage;
    return data;
  }
}
