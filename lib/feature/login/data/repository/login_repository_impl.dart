import 'package:frenzi/feature/login/data/model/user_model.dart';
import 'package:frenzi/feature/login/data/remote/login_remote_source.dart';
import 'package:frenzi/feature/login/data/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl(this._remoteSource);

  final LoginRemoteSource _remoteSource;

  @override
  Future<UserModel> login(String email, String password) {
    return _remoteSource.login(email, password);
  }
}
