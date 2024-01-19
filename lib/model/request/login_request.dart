
class LoginRequest {
  String? employeeCode;
  String? password;

  LoginRequest({this.employeeCode, this.password});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    employeeCode = json['employee_code'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['employee_code'] = employeeCode;
    data['password'] = password;
    return data;
  }
}

