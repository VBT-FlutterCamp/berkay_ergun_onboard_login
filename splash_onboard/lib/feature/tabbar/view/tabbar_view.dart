import 'package:flutter/material.dart';
import 'package:splash_onboard/core/constants/colors/tabbar_color.dart';

import '../model/tabbar_model.dart';

class TabbarView extends StatelessWidget {
  TabbarView({Key? key}) : super(key: key);

  final int _tabbarLength = 4;
  final Icon _floatingActionIcon = Icon(Icons.access_alarms);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabbarLength,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: TabbarColor.tabbarIconColor,
          onPressed: () {},
          child: _floatingActionIcon,
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: BottomAppBar(
          color: TabbarColor.tabbarBackGroundColor,
          child: _buildTabBar(),
        ),
        body: _buildTabBarView(),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      indicatorColor: TabbarColor.tabbarBackIndicatorColor,
      tabs: List.generate(
        tabsItem.length,
        (index) => Tab(
            text: tabsItem[index].title,
            icon: Icon(
              tabsItem[index].icon,
              color: TabbarColor.tabbarIconColor,
            )),
      ),
    );
  }

  TabBarView _buildTabBarView() => TabBarView(
        children: tabsItem.map((e) => e.page).toList(),
      );
}
