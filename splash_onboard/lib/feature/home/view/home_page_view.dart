import 'package:flutter/material.dart';
import 'package:splash_onboard/core/constants/colors/homepage_color.dart';
import 'package:kartal/kartal.dart';
import 'package:splash_onboard/core/constants/strings/home_page_strings.dart';

import '../model/home_page_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);
  static const double _titleLetterSpacing = 2;
  static const double _borderSideWidth = 2;
  static const double _iconSize = 36;
  static const routeName = '/homeview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomePageColor.homePageBG,
      body: Padding(
        padding: context.paddingLow,
        child: SingleChildScrollView(
          child: Padding(
            padding: context.verticalPaddingHigh,
            child: Column(
              children: [
                _buildTitleText(context),
                _buildSubTexts(context),
                _buildHomePageCards()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleText(BuildContext context) {
    return Text(
      HomePageStrings.title,
      style: context.textTheme.headline3?.copyWith(
        color: HomePageColor.titleColor,
        fontWeight: FontWeight.bold,
        letterSpacing: _titleLetterSpacing,
      ),
    );
  }

  Widget _buildSubTexts(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Subscriptions (${cardModels.length})",
          style: context.textTheme.headline6?.copyWith(
            color: HomePageColor.titleColor,
          ),
        ),
        TextButton(
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              const BorderSide(
                color: HomePageColor.titleColor,
                width: _borderSideWidth,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: context.lowBorderRadius,
              ),
            ),
          ),
          onPressed: () {},
          child: Text(
            HomePageStrings.cleaned,
            style: context.textTheme.headline6?.copyWith(
              color: HomePageColor.titleColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHomePageCards() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: cardModels.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: context.normalBorderRadius,
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  cardModels[index].title,
                  style: context.textTheme.headline6?.copyWith(
                    color: HomePageColor.cardTextColor,
                  ),
                ),
                subtitle: Text(cardModels[index].subTitle),
                trailing: Icon(
                  cardModels[index].icon,
                  size: _iconSize,
                  color: HomePageColor.cardIconColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
