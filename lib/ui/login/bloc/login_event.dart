abstract class LoginEvent {
  const LoginEvent();
}

class ValidateLoginEvent extends LoginEvent {
  final String username;
  final String password;

  ValidateLoginEvent({required this.username, required this.password});
}
