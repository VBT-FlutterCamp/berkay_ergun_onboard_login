import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);
  final String _imagePath = 'assets/images/landing.png';

  @override
  Widget build(BuildContext context) {
    // Todo: Yapılacak!
    return Stack(
      children: [
        Image.asset(
          _imagePath,
          height: context.dynamicHeight(1),
          width: context.dynamicWidth(1),
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: context.verticalPaddingHigh * 2,
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      'Cleaning your inbox has never been easier.',
                      style: context.textTheme.headline4?.copyWith(
                        color: Colors.black,
                        letterSpacing: 3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: context.verticalPaddingLow,
                      child: Text(
                        'Clean up old subscriptions and say no to email carbon!',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.black,
                              letterSpacing: 1,
                            ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: context.verticalPaddingHigh * 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Get Started"),
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(context.width * 0.6, context.height * 0.09),
                      primary: Colors.white,
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
