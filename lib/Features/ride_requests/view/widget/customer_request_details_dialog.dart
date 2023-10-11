import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/ColorHelper.dart';

import '../../../../Core/general_components/main_button.dart';
import '../../../UserHome/View/components/mab.dart';
import '../../../UserHome/ViewModel/cubit/user_home_cubit.dart';
import '../../model/ride_request.dart';

Future customerRequestDetailsDialog({
  required BuildContext context,
  required RideRequest rideRequest ,
}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Request',
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          height: 0.85.sh,
          width: 0.90.sh,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12.w)),
          child:  Scaffold(body: CustomerRequestDetails(rideRequest: rideRequest,)),
        ),
      );
    },
  );
}

class CustomerRequestDetails extends StatelessWidget {
  const CustomerRequestDetails({super.key, required this.rideRequest});

  final RideRequest rideRequest;
  @override
  Widget build(BuildContext context) {
    var cubit = UserHomeCubit.get(context);
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: Column(
        children: [
          SizedBox(
            height: 0.45.sh,
            child: Mab(cupit: cubit),
          ),
          SizedBox(height: 30.h),
          MainButton(
            text: 'Agreed for ${rideRequest.price} EGP',
            onTap: () {},
            color: ColorHelper.greenColor,
          ),
          SizedBox(height: 30.h),
          Text(
            'offer your price :',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOfferButton('20 EGP'),
              buildOfferButton('25 EGP'),
              buildOfferButton('30 EGP'),
            ],
          )
        ],
      ),
    );
  }

  Widget buildOfferButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorHelper.greenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.w),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: ColorHelper.darkColor,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
