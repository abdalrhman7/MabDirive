import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/ColorHelper.dart';
import 'package:mab_drive/Core/general_components/defult_text_form_field.dart';
import 'package:mab_drive/Features/UserHome/View/components/ride_car_type.dart';

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
      height: 250.h,
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
            defaultTextFormFelid(
                controller: TextEditingController(),
                text: 'Pickup location',
                enabled: false,
                prefixIcon:
                    Icon(Icons.location_on, size: 20.r, color: Colors.white),
                fillColor: Colors.white)
          ],
        ),
      ),
    );
  }
}
