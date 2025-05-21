import 'package:equatable/equatable.dart';
import 'package:frenzi/common/enum/view_model_status_enum.dart';
import 'package:frenzi/feature/trips/data/model/trip_model.dart';

class TripsState extends Equatable {
  const TripsState({
    this.previousTripsStatus = ViewModelStatus.initial,
    this.previousTripsData = const [],
    this.previousTripsError,
  });

  final ViewModelStatus previousTripsStatus;
  final List<TripModel> previousTripsData;
  final Exception? previousTripsError;

  TripsState copyWith({
    ViewModelStatus? previousTripsStatus,
    List<TripModel>? previousTripsData,
    Exception? previousTripsError,
  }) {
    return TripsState(
      previousTripsStatus: previousTripsStatus ?? this.previousTripsStatus,
      previousTripsData: previousTripsData ?? this.previousTripsData,
      previousTripsError: previousTripsError ?? this.previousTripsError,
    );
  }

  @override
  List<Object?> get props => [
    previousTripsStatus,
    previousTripsData,
    previousTripsError,
  ];
}
