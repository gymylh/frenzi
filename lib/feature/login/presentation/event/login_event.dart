abstract class LoginEvent {}

class UserLoginRequested extends LoginEvent {
  UserLoginRequested({required this.username, required this.password});

  final String username;
  final String password;
}
