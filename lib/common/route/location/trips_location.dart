import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:frenzi/feature/trips/presentation/screen/trips_screen.dart';

class TripsLocation extends BeamLocation<BeamState> {
  static const route = '/trips';
  static const key = 'trips';
  static const name = 'Trips';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return const [
      BeamPage(key: ValueKey(key), name: name, child: TripsScreen()),
    ];
  }

  @override
  List<Pattern> get pathPatterns => const [route];
}
