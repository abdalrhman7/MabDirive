import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/ColorHelper.dart';

import '../../../../Core/general_components/main_button.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 1,
      child: InkWell(
        onTap: () {
          _navbar(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 0.06.sh,
          width: 0.25.sh,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            color: const Color(0xff272829),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.route,
                color: Colors.white,
              ),
              SizedBox(width: 4.w),
              Text(
                'En route requests',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _navbar(BuildContext context) {
    return showModalBottomSheet(
      useRootNavigator: true,
      constraints: BoxConstraints(maxHeight: 0.28.sh),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: ColorHelper.darkColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.w),
              topRight: Radius.circular(20.w),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'En route requests',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter destination',
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                  ), //icon at head of input
                ),
              ),
              const Spacer(),
              MainButton(
                color: ColorHelper.greenColor,
                text: 'Go',
                onTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
