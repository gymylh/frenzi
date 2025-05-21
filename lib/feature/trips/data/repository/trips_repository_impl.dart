import 'package:frenzi/feature/trips/data/model/trip_model.dart';
import 'package:frenzi/feature/trips/data/remote/trips_remote_source.dart';
import 'package:frenzi/feature/trips/data/repository/trips_repository.dart';

class TripsRepositoryImpl extends TripsRepository {
  TripsRepositoryImpl(this._remoteSource);

  final TripsRemoteSource _remoteSource;

  @override
  Future<List<TripModel>> getPreviousTrips() {
    return _remoteSource.getPreviousTrips();
  }
}
