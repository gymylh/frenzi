import 'package:frenzi/common/di/service_locator.dart';
import 'package:frenzi/feature/login/data/remote/login_remote_source.dart';
import 'package:frenzi/feature/login/data/repository/login_repository_impl.dart';

final loginRepositoryDI = LoginRepositoryImpl(LoginRemoteSource(httpClient));
