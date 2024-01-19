import '../../../model/response/login_response.dart';

class LoginState {
  const LoginState();
}

final class LoginInitial extends LoginState {}

class LoadingState extends LoginState {}

class LoginFailedState extends LoginState {
  String? message;

  LoginFailedState(this.message);
}

class LoginSuccessState extends LoginState {
  LoginResponse? loginResponse;

  LoginSuccessState(this.loginResponse);
}
