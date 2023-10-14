import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Features/ride_requests/view_model/ride_request_cubit/ride_request_cubit.dart';

import '../../../../Core/ColorHelper.dart';

class SwitchButtonWidget extends StatelessWidget {
  const SwitchButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<RideRequestCubit>(context);
    return BlocBuilder<RideRequestCubit, RideRequestState>(
      buildWhen: (previous, current) =>
          previous != current && current is SwitchIsOfflineState,
      builder: (context, state) {
        return InkWell(
          onTap: () {
            cubit.switchIsOffline();
          },
          child: Container(
            width: .22.sh,
            height: .05.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.w),
              border: Border.all(
                  color: cubit.isOffline
                      ? Colors.redAccent
                      : ColorHelper.greenColor),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: cubit.isOffline,
                    child: isOfflineButton(
                        color: Colors.redAccent, text: 'Offline'),
                  ),
                  Visibility(
                    visible: !cubit.isOffline,
                    child: isOfflineButton(
                        color: ColorHelper.greenColor, text: 'Online'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget isOfflineButton({required Color color, required String text}) {
    return Container(
      width: .11.sh,
      height: 30.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorHelper.darkColor,
          ),
        ),
      ),
    );
  }
}
