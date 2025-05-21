import 'package:frenzi/feature/trips/data/model/trip_model.dart';

abstract class TripsRepository {
  Future<List<TripModel>> getPreviousTrips();
}
