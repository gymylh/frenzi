import 'package:frenzi/common/di/service_locator.dart';
import 'package:frenzi/feature/trips/data/remote/trips_remote_source.dart';
import 'package:frenzi/feature/trips/data/repository/trips_repository_impl.dart';

final tripsRepositoryDI = TripsRepositoryImpl(TripsRemoteSource(httpClient));
