
class LoginResponse {
  int? status;
  String? message;
  String? email;

  LoginResponse({this.status, this.message, this.email});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['email'] = email;
    return data;
  }
}

