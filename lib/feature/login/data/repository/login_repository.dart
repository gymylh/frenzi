import 'package:frenzi/feature/login/data/model/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> login(String email, String password);
}
