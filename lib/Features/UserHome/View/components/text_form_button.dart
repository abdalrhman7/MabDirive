import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormButton extends StatelessWidget {
  const TextFormButton({
    super.key,
    required this.hintText,
    required this.icon,
    required this.onTab,
  });
  final Widget icon;
  final String hintText;
  final Function onTab;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
                width: 280.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hintText,
                      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                    ),
                    const Divider()
                  ],
                )),
          )
        ],
      ),
    );
  }
}
