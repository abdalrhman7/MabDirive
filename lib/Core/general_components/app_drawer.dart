import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/ColorHelper.dart';
import 'package:mab_drive/Core/general_components/main_button.dart';

import 'account_details_widget.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 48.h),
          const AccountDetailsWidget(),
          buildListTile(icon: Icons.car_crash_outlined, text: 'City'),
          buildListTile(icon: Icons.person_2_outlined, text: 'My Account'),
          buildListTile(
              icon: Icons.miscellaneous_services_outlined, text: 'Services'),
          buildListTile(icon: Icons.language_outlined, text: 'City to city'),
          buildListTile(icon: Icons.car_repair_sharp, text: 'Freight'),
          buildListTile(icon: Icons.health_and_safety_outlined, text: 'Safety'),
          buildListTile(icon: Icons.settings, text: 'Settings'),
          buildListTile(icon: Icons.info_outline, text: 'FAQ'),
          buildListTile(icon: Icons.support_agent, text: 'Support'),
          buildListTile(icon: Icons.edit, text: 'Online registration'),
          Divider(color: Colors.grey[700]),
          SizedBox(height: 14.h),
          SizedBox(
            width: 0.35.sh,
            child: MainButton(
              text: 'Passenger Mode',
              onTap: () {},
              color: ColorHelper.greenColor,
            ),
          ),
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
