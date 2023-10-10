import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/ColorHelper.dart';
import 'package:mab_drive/Core/general_components/defult_text_form_field.dart';
import 'package:mab_drive/Core/general_components/main_button.dart';
import 'package:mab_drive/Features/UserHome/View/components/ride_car_type.dart';
import 'package:mab_drive/Features/UserHome/View/components/text_form_button.dart';

class UserHomeLowerPart extends StatefulWidget {
  const UserHomeLowerPart({
    super.key,
  });

  @override
  State<UserHomeLowerPart> createState() => _UserHomeLowerPartState();
}

class _UserHomeLowerPartState extends State<UserHomeLowerPart> {
  String selectedType = "Ride";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 360.w,
      decoration: BoxDecoration(
          color: ColorHelper.darkColor,
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
              width: 360.w,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedType = "Ride";
                      });
                    },
                    child: RideCarType(
                      selectedType: selectedType,
                      imgPath: 'Assets/Images/car.png',
                      title: "Ride",
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedType = "Comfort";
                      });
                    },
                    child: RideCarType(
                      selectedType: selectedType,
                      imgPath: 'Assets/Images/comfort_car.png',
                      title: "Comfort",
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedType = "Motorcycle";
                      });
                    },
                    child: RideCarType(
                      selectedType: selectedType,
                      imgPath: 'Assets/Images/motorcycle.png',
                      title: "Motorcycle",
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormButton(
              hintText: "Pickup location",
              icon: Icon(Icons.circle_outlined, size: 30.r, color: Colors.grey),
              onTab: () {},
            ),
            TextFormButton(
              hintText: "Destination",
              icon: Icon(Icons.circle_outlined, size: 30.r, color: Colors.grey),
              onTab: () {},
            ),
            TextFormButton(
              hintText: "Offer your fare",
              icon: Text(
                "EGP",
                style: TextStyle(color: Colors.grey, fontSize: 18.sp),
              ),
              onTab: () {},
            ),
            SizedBox(
              height: 10.h,
            ),
            MainButton(
              text: "Find a driver",
              onTap: () {},
              color: ColorHelper.greenColor,
            )
          ],
        ),
      ),
    );
  }
}
