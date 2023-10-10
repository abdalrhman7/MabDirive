import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30.h,
      left: 20.w,
      child: CircleAvatar(
        backgroundColor: Colors.black.withOpacity(0.3),
        minRadius: 22.r,
        child: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            size: 22.r,
          ),
        ),
      ),
    );
  }
}
