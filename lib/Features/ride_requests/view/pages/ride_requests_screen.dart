import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/custom_app_bar.dart';
import '../widget/custom_floating_action_button.dart';
import '../widget/send_offers_widget.dart';

class RideRequestsScreen extends StatelessWidget {
  const RideRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Stack(
          children: [
            Column(
              children: [
                const CustomAppBar(),
                SizedBox(height: 18.h),
                const SendOffersWidget(),
              ],
            ),
            const CustomFloatingActionButton(),
          ],
        ),
      ),
    );
  }
}
