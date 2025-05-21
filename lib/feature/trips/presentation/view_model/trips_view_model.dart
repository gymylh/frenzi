import 'package:bloc/bloc.dart';
import 'package:frenzi/common/enum/view_model_status_enum.dart';
import 'package:frenzi/feature/trips/data/repository/trips_repository.dart';
import 'package:frenzi/feature/trips/presentation/event/trips_event.dart';
import 'package:frenzi/feature/trips/presentation/state/trips_state.dart';
import 'dart:math';

class TripsViewModel extends Bloc<TripsEvent, TripsState> {
  TripsViewModel(this._tripsRepository) : super(const TripsState()) {
    on<PreviousTripsRequested>(_onPreviousTripsRequested);
  }

  final TripsRepository _tripsRepository;

  Future<void> _onPreviousTripsRequested(
    PreviousTripsRequested event,
    Emitter<TripsState> emit,
  ) async {
    emit(state.copyWith(previousTripsStatus: ViewModelStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    var randomNumber = 1 + Random().nextInt(5 - 1);
    if (randomNumber <= 2) {
      try {
        final result = await _tripsRepository.getPreviousTrips();
        emit(
          state.copyWith(
            previousTripsStatus: ViewModelStatus.success,
            previousTripsData: result,
          ),
        );
      } on Exception catch (error) {
        emit(
          state.copyWith(
            previousTripsStatus: ViewModelStatus.error,
            previousTripsError: error,
          ),
        );
      }
    } else if (randomNumber == 3) {
      emit(
        state.copyWith(
          previousTripsStatus: ViewModelStatus.error,
          previousTripsError: Exception('Something went wrong'),
        ),
      );
    } else {
      emit(
        state.copyWith(
          previousTripsStatus: ViewModelStatus.success,
          previousTripsData: [],
        ),
      );
    }
  }
}
