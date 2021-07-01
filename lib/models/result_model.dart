class ResultModel {
  int code;
  String? message;
  dynamic data;
  ResultModel({required this.code, this.message, this.data});

  factory ResultModel.fromJson(Map<String, dynamic> jsonMap) {
    return ResultModel(
        code: jsonMap['code'],
        message: jsonMap['message'],
        data: jsonMap["data"]);
  }
}
