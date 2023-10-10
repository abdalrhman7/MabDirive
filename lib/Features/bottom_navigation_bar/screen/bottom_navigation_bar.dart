import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../Core/ColorHelper.dart';
import '../../../Core/general_components/app_drawer.dart';
import '../../ride_requests/view/pages/ride_requests_screen.dart';

class DriverBottomNavbar extends StatefulWidget {
  const DriverBottomNavbar({Key? key}) : super(key: key);
  static const String routeName = 'BottomNavbar';

  @override
  State<DriverBottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<DriverBottomNavbar> {
  final _bottomNavbarController = PersistentTabController();

  List<Widget> _buildScreens() {
    return [
      const RideRequestsScreen(),
      Container(),
      Container(),
      Container(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.menu),
        title: ('Ride requests'),
        // activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        title: 'My income',
        icon: const ImageIcon(
          AssetImage('Assets/Images/money.png'),
        ),
        //activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.star_border_rounded),
        title: ('Rating'),
        //  activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.payment),
        title: ('Pay'),
        //activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  PersistentTabView _persistentTabView() {
    return PersistentTabView(
      context,
      controller: _bottomNavbarController,
      backgroundColor: ColorHelper.darkColor,
      stateManagement: true,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.grey,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(currentPage: "DriverHome"),
      body: _persistentTabView(),
    );
  }
}
