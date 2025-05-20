import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:frenzi/feature/login/presentation/screen/login_screen.dart';

class LoginLocation extends BeamLocation<BeamState> {
  static const route = '/login';
  static const key = 'login';
  static const name = 'Login';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return const [
      BeamPage(key: ValueKey(key), name: name, child: LoginScreen()),
    ];
  }

  @override
  List<Pattern> get pathPatterns => const [route];
}
