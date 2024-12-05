
class ErrorModel {
  int? code;
  bool? error;
  String? msg;

  ErrorModel({this.code, this.error, this.msg});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    error = json['error'];
    msg = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['error'] = error;
    data['message'] = msg;


    return data;
  }
}
