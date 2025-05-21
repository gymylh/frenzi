import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:frenzi/feature/trips/data/model/trip_model.dart';
import 'package:frenzi/feature/trips/presentation/screen/detailed_trip_screen.dart';

class DetailedTripLocation extends BeamLocation<BeamState> {
  static const route = '/detailed-trip';
  static const key = 'detailed-trip';
  static const name = 'Detailed Trip';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final tripModel = data as TripModel?;

    return [
      BeamPage(
        key: ValueKey('$key-${DateTime.now()}'),
        name: name,
        child: DetailedTripScreen(tripModel: tripModel ?? TripModel.empty()),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => const [route];
}
