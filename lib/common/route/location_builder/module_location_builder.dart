import 'package:beamer/beamer.dart';
import 'package:frenzi/common/route/location/location.dart';

final moduleLocationBuilder = BeamerLocationBuilder(
  beamLocations: [LoginLocation(), SplashLocation(), TripsLocation()],
);
