import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/general_components/main_button.dart';
import 'package:mab_drive/Features/UserHome/Model/ride_request_model.dart';

class WaiteDriverScreen extends StatelessWidget {
  const WaiteDriverScreen({super.key, required this.rideRequestModel});
  final RideRequestModel rideRequestModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120.w,
              width: 120.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.w),
                color: Colors.white,
              ),
              child: Image.network(
                  'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                  fit: BoxFit.fill),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Driver : ${rideRequestModel.driverName}",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Price : ${rideRequestModel.targetPrice!}",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Waiting Time : 5 min ",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:
                  MainButton(text: "Cancels", color: Colors.red, onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
