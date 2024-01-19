

abstract  class HomeEvent{
  const HomeEvent();
}

class ValidateHomeEvent extends HomeEvent {
  final String username;
  final String password;
  const ValidateHomeEvent({required this.username, required this.password});

}