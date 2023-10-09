import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/ColorHelper.dart';

class SwitchButtonWidget extends StatefulWidget {
  const SwitchButtonWidget({super.key});

  @override
  State<SwitchButtonWidget> createState() => _SwitchButtonWidgetState();
}

class _SwitchButtonWidgetState extends State<SwitchButtonWidget> {
  bool isOffline = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isOffline = !isOffline;
        });
      },
      child: Container(
        width: .22.sh,
        height: .05.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.w),
          border: Border.all(
              color:
                  isOffline ? ColorHelper.mainColor : ColorHelper.greenColor),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: isOffline,
                child: isOfflineButton(
                    color: ColorHelper.mainColor, text: 'Offline'),
              ),
              Visibility(
                visible: !isOffline,
                child: isOfflineButton(
                    color: ColorHelper.greenColor, text: 'Online'),
              ),
            ],
          ),
        ),
      ),
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
