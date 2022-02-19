import 'package:flutter/material.dart';
import 'package:splash_onboard/core/constants/image/splash_image_path.dart';
import 'package:splash_onboard/core/constants/navigation/navigation_constants.dart';
import '../../../core/constants/colors/splash_color.dart';
import '../../../core/constants/strings/splash_strings.dart';
import 'package:kartal/kartal.dart';
import '../../../core/init/navigation/navigation_route.dart';
import '../../onboard/view/onboard_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(context.durationSlow, () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        OnBoardView.routeName,
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SplashColor.splashBackGroundColor,
      body: _buildSplashColumn(context),
    );
  }

  Widget _buildSplashColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            width: context.width * 0.6,
            height: context.height * 0.3,
            child: Column(
              children: [
                Image.asset(SplashImage.splashImage),
              ],
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: context.paddingLow,
            child: Text(
              SplashStrings.splashText,
              style: context.textTheme.headline4
                  ?.copyWith(color: context.appTheme.bottomAppBarColor),
            ),
          ),
        ),
      ],
    );
  }
}
