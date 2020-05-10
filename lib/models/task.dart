class TasksModel {
  bool done;
  String createdAt;
  int status;
  String id;
  String title;
  String description;
  String userId;
  String error;
  String message;
  String resume;
  String dueTime;
  String dueDate;

  TasksModel({
    this.done,
    this.createdAt,
    this.status,
    this.id,
    this.title,
    this.description,
    this.userId,
    this.error,
    this.message,
    this.resume,
  });

  TasksModel.fromJson(Map<String, dynamic> json) {
    done = json['done'];
    createdAt = json['createdAt'];
    status = json['status'];
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    userId = json['user_id'];
    message = json['message'];
    resume = json['resume'];
    dueTime = json['dueTime'];
    dueDate = json['dueDate'];
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
    data['error'] = this.error;
    data['message'] = this.message;
    data['resume'] = this.resume;
    data['dueDate'] = this.dueDate;
    data['dueTime'] = this.dueTime;
    return data;
  }
}
