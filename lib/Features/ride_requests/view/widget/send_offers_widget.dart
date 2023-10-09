import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendOffersWidget extends StatelessWidget {
  const SendOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Send seven offers',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'This is how many it usually takes to get the first order',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 20.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.car_crash_outlined,
                color: Colors.grey[700],
                size: 34,
              ),
              ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.remove,
                    color: Colors.grey[700],
                    size: 40,
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Divider(
          color: Colors.grey[700],
        )
      ],
    );
  }
}