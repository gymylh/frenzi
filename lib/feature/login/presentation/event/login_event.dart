abstract class LoginEvent {}

class UserLoginRequested extends LoginEvent {
  UserLoginRequested({required this.email, required this.password});

  final String email;
  final String password;
}
