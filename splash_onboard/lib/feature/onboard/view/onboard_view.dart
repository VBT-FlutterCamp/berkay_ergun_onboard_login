import 'package:flutter/material.dart';
import 'package:splash_onboard/core/constants/colors/onboard_color.dart';
import 'package:splash_onboard/core/constants/strings/button_strings.dart';
import 'package:splash_onboard/feature/login/view/login_page.dart';
import 'package:splash_onboard/feature/onboard/model/onboard_model.dart';
import 'package:kartal/kartal.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);
  static const routeName = '/onBoardView';
  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  int currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: onboardModels.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: context.height * 0.5,
                width: context.width,
                child: Image.asset(onboardModels[index].image,
                    fit: BoxFit.fitWidth),
              ),
              Container(
                width: context.width * 1,
                height: context.dynamicWidth(0.9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: context.normalRadius,
                    topRight: context.normalRadius,
                  ),
                ),
                child: Column(
                  children: [
                    _buildPageNavigator(index, context),
                    _buildTextColumn(index, context),
                    Padding(
                      padding: context.verticalPaddingMedium,
                      child: _buildElevatedButtons(context, index),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Row _buildElevatedButtons(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: context.horizontalPaddingNormal,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                LoginPage.routeName,
              );
            },
            child: const Text(ButtonStrings.skipButton),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(context.width * 0.3, context.height * 0.05),
              primary: onboardColor.onBoardButtonSkipBG,
              elevation: 0,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (index == onboardModels.length - 1) {
              Navigator.pushNamed(
                context,
                LoginPage.routeName,
              );
            } else {
              _pageController?.nextPage(
                duration: context.durationLow,
                curve: Curves.easeIn,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(context.width * 0.3, context.height * 0.05),
            elevation: 0,
            primary: onboardColor.buttonColor,
          ),
          child: const Text(ButtonStrings.nextButton),
        ),
      ],
    );
  }

  Widget _buildTextColumn(int index, BuildContext context) {
    return Column(
      children: [
        Text(onboardModels[index].title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: context.dynamicWidth(0.06),
              fontWeight: FontWeight.w600,
            )),
        Padding(
          padding: context.verticalPaddingMedium,
          child: Text(
            onboardModels[index].description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: context.dynamicWidth(0.04),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageNavigator(int index, BuildContext context) {
    return Padding(
      padding: context.verticalPaddingMedium,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (indexDots) {
            return Padding(
              padding: context.paddingLow,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: index == indexDots
                      ? Colors.orange
                      : Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(context.width * 0.05),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
