import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/ColorHelper.dart';
import 'package:mab_drive/Core/general_components/main_button.dart';
import 'package:mab_drive/Features/History/View/Pages/history_screen.dart';
import 'package:mab_drive/Features/Profile%20Screen/View/Pages/profile_screen.dart';
import 'package:mab_drive/Features/UserHome/View/pages/user_home.dart';
import 'package:mab_drive/Features/bottom_navigation_bar/screen/bottom_navigation_bar.dart';

import 'account_details_widget.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key, required this.currentPage}) : super(key: key);
  final String currentPage;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 48.h),
          const AccountDetailsWidget(),
          SizedBox(height: 14.h),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, HistoryScreen.routeName);
              },
              child: buildListTile(icon: Icons.history, text: 'History')),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, ProfileScreen.routeName);
              },
              child: buildListTile(icon: Icons.settings, text: 'Settings')),
          const Spacer(),
          Divider(color: Colors.grey[700]),
          SizedBox(height: 14.h),
          SizedBox(
            width: 0.32.sh,
            child: MainButton(
              text: (currentPage == "UserHome") ? 'Driver Mode' : "User Mode",
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    (currentPage == "UserHome")
                        ? DriverBottomNavbar.routeName
                        : UserHome.routeName,
                    (route) => false);
              },
              color: ColorHelper.greenColor,
            ),
          ),
          SizedBox(height: 14.h),
        ],
      ),
    );
  }

  Widget buildListTile({required IconData icon, required String text}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey.shade100),
      title: Text(
        text,
        style: TextStyle(color: Colors.grey.shade100),
      ),
    );
  }
}
