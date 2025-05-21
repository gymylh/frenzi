import 'package:bloc/bloc.dart';
import 'package:frenzi/common/enum/view_model_status_enum.dart';
import 'package:frenzi/feature/trips/data/repository/trips_repository.dart';
import 'package:frenzi/feature/trips/presentation/event/trips_event.dart';
import 'package:frenzi/feature/trips/presentation/state/trips_state.dart';

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
  }
}
