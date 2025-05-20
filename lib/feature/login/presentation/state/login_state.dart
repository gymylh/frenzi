import 'package:equatable/equatable.dart';
import 'package:frenzi/common/enum/view_model_status_enum.dart';
import 'package:frenzi/feature/login/data/model/user_model.dart';

class LoginState extends Equatable {
  const LoginState({
    this.loginStatus = ViewModelStatus.initial,
    this.loginData,
    this.loginError,
  });

  final ViewModelStatus loginStatus;
  final UserModel? loginData;
  final Exception? loginError;

  LoginState copyWith({
    ViewModelStatus? loginStatus,
    UserModel? loginData,
    Exception? loginError,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      loginData: loginData ?? this.loginData,
      loginError: loginError ?? this.loginError,
    );
  }

  @override
  List<Object?> get props => [loginStatus, loginData, loginError];
}
