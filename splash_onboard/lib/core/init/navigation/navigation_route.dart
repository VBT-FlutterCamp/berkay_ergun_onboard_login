import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Scaffold;
import '../../constants/navigation/navigation_constants.dart';
import '../../../feature/onboard/view/onboard_view.dart';
import '../../../feature/splash/view/splash_view.dart';

import '../../../main.dart';

class NavigationRoute {
  static Route<CupertinoPageRoute> generateRoute(RouteSettings settings, ) {

    switch (settings.name) {
      case NavigationConstants.SPLASH_VIEW:
        return CupertinoPageRoute(builder: (_) =>   const SplashScreen());
      case NavigationConstants.ONBOARD_VIEW:
        return CupertinoPageRoute(builder: (_) =>   OnBoardView());

      default:
        return CupertinoPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Bulunamadi'))),
        );
    }
  }
}