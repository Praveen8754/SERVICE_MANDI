import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../model/request/login_request.dart';
import '../../../model/response/login_response.dart';
import '../../../service/api_manager.dart';
import '../../../service/endpoints.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
   /* on<LoginEvent>((event, emit) {
      if (event is ValidateLoginEvent) {
        _login(event, emit);
      }
    });*/
    on<ValidateLoginEvent>(_login);
  }

  _login(ValidateLoginEvent event, Emitter<LoginState> emit) async {
    LoginResponse loginResponse;
    emit(LoadingState());
    try {
      LoginRequest loginRequest = LoginRequest();

      loginRequest.employeeCode = event.username;
      loginRequest.password = event.password;

      final response = await ApiManager().getDio()!.post(
          "${Endpoints.baseUrl}${Endpoints.userLogin}",
          data: loginRequest);
      print(response);
      if (response.statusCode == 404) {
        emit(LoginFailedState('Failed to login'));
      } else if (response.statusCode == 200) {
        loginResponse = LoginResponse.fromJson(response.data);
        emit(LoginSuccessState(loginResponse));
        print(loginResponse.message);
      } else {
        emit(LoginFailedState('Failed to login'));
      }
    } catch (e) {
      emit(LoginFailedState('Failed to login'));
    }

  }
}
