import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:frenzi/feature/splash/presentation/screen/splash_screen.dart';

class SplashLocation extends BeamLocation<BeamState> {
  static const route = '/splash';
  static const key = 'splash';
  static const name = 'Splash';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return const [
      BeamPage(key: ValueKey(key), name: name, child: SplashScreen()),
    ];
  }

  @override
  List<Pattern> get pathPatterns => const [route];
}
