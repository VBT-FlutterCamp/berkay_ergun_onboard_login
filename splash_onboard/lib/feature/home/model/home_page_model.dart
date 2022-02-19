import 'package:flutter/material.dart';
import 'package:splash_onboard/core/constants/icon/home_page_icon.dart';

class HomePageModel {
  final String title;
  final String subTitle;
  final IconData icon;

  HomePageModel(
      {required this.title, required this.subTitle, required this.icon});
}

List<HomePageModel> cardModels = [
  HomePageModel(
      title: "Coding Journey",
      subTitle: "wwww.coding-journey.io",
      icon: HomePageIcon.cardIcon),
  HomePageModel(
      title: "Smashing Magazine",
      subTitle: "https://www.smashingmagazine.com",
      icon: HomePageIcon.cardIcon),
  HomePageModel(
      title: "UX Labs",
      subTitle: "https://www.uxlabs.co",
      icon: HomePageIcon.cardIcon),
  HomePageModel(
      title: "The Netlify Blog",
      subTitle: "https://www.netlify.com/blog/",
      icon: HomePageIcon.cardIcon),
  HomePageModel(
      title: "Student Life",
      subTitle: "https://www.studentlife.com",
      icon: HomePageIcon.cardIcon),
  HomePageModel(
      title: "Hello.io",
      subTitle: "https://www.hello.io",
      icon: HomePageIcon.cardIcon),
];
