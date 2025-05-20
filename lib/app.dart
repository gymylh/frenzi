import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:frenzi/common/route/location/location.dart';
import 'package:frenzi/common/route/location_builder/module_location_builder.dart';
import 'package:frenzi/common/theme/theme.dart';
import 'package:frenzi/feature/login/data/di/login_repository_di.dart';
import 'package:frenzi/feature/login/presentation/view_model/login_view_model.dart';
import 'package:sizer/sizer.dart';

final GlobalKey globalKey = GlobalKey();

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerDelegate = useMemoized(() {
      return BeamerDelegate(
        initialPath: SplashLocation.route,
        locationBuilder: moduleLocationBuilder.call,
      );
    });

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginViewModel(loginRepositoryDI)),
      ],
      child: BeamerProvider(
        key: globalKey,
        routerDelegate: routerDelegate,
        child: Sizer(
          builder: (context, orientation, screenType) {
            return MaterialApp.router(
              theme: merchantPortalTheme,
              themeMode: ThemeMode.light,
              routeInformationParser: BeamerParser(),
              routerDelegate: routerDelegate,
            );
          },
        ),
      ),
    );
  }
}
