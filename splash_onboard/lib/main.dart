import 'package:flutter/material.dart';
import 'package:splash_onboard/feature/home/view/home_page_view.dart';
import 'package:splash_onboard/feature/landing/view/landing_view.dart';
import 'package:splash_onboard/feature/login/view/login_page.dart';
import 'package:splash_onboard/feature/onboard/view/onboard_view.dart';
import 'package:splash_onboard/feature/tabbar/view/tabbar_view.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'feature/splash/view/splash_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: NavigationRoute.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const SplashScreen(),
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        OnBoardView.routeName: (context) => const OnBoardView(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomePageView.routeName: (context) => const HomePageView(),
      },
    );
  }
}
