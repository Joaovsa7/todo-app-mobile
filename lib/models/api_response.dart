class APIResponse<Type> {
  Type data;
  bool error;
  String errorMessage;

  APIResponse({this.data, this.error, this.errorMessage});
}
