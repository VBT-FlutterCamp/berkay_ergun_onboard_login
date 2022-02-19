import 'package:flutter/material.dart';
import 'package:splash_onboard/feature/home/view/home_page_view.dart';

class TabModel {
  final String? title;
  final IconData icon;
  final Widget page;

  TabModel({this.title, required this.icon, required this.page});
}

final List<TabModel> tabsItem = [
  TabModel(icon: Icons.home, page: const HomePageView()),
  TabModel(icon: Icons.search_off_rounded, page: Container(color: Colors.red)),
  TabModel(icon: Icons.live_tv_rounded, page: Container(color: Colors.blue)),
  TabModel(
      icon: Icons.person_outline_rounded, page: Container(color: Colors.blue)),
];
