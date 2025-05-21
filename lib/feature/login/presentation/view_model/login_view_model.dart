import 'package:bloc/bloc.dart';
import 'package:frenzi/common/enum/view_model_status_enum.dart';
import 'package:frenzi/feature/login/data/repository/login_repository.dart';
import 'package:frenzi/feature/login/presentation/event/login_event.dart';
import 'package:frenzi/feature/login/presentation/state/login_state.dart';

class LoginViewModel extends Bloc<LoginEvent, LoginState> {
  LoginViewModel(this._loginRepository) : super(const LoginState()) {
    on<UserLoginRequested>(_onUserLoginRequested);
  }

  final LoginRepository _loginRepository;

  Future<void> _onUserLoginRequested(
    UserLoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(loginStatus: ViewModelStatus.loading));
    try {
      final result = await _loginRepository.login(event.email, event.password);
      emit(
        state.copyWith(loginStatus: ViewModelStatus.success, loginData: result),
      );
    } on Exception catch (error) {
      emit(
        state.copyWith(loginStatus: ViewModelStatus.error, loginError: error),
      );
    }
  }
}
