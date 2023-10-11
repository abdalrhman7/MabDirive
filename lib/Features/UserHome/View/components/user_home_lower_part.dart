import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/ColorHelper.dart';
import 'package:mab_drive/Core/general_components/defult_text_form_field.dart';
import 'package:mab_drive/Core/general_components/main_button.dart';
import 'package:mab_drive/Features/UserHome/View/components/ride_car_type.dart';
import 'package:mab_drive/Features/UserHome/View/components/text_form_button.dart';
import 'package:mab_drive/Features/UserHome/ViewModel/cubit/user_home_cubit.dart';
import 'package:mab_drive/Features/location%20search/View/pages/location_search_screen.dart';

class UserHomeLowerPart extends StatefulWidget {
  UserHomeLowerPart({super.key, required this.cupit});
  UserHomeCubit cupit;
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
              hintText: widget.cupit.pickupLocationAddress ?? "Pickup location",
              icon: Icon(Icons.circle_outlined, size: 30.r, color: Colors.grey),
              onTab: () {
                showFlexibleBottomSheet(
                  minHeight: 0,
                  initHeight: 0.8,
                  maxHeight: 1,
                  context: context,
                  bottomSheetColor: Colors.transparent,
                  builder: (context, scrollController, bottomSheetOffset) =>
                      SearchBottomSheet(
                    scrollController: scrollController,
                    searchText: "Pickup location",
                  ),
                  anchors: [0, 0.5, 1],
                  isSafeArea: true,
                );
              },
            ),
            TextFormButton(
              hintText:
                  widget.cupit.destinationLocationAddress ?? "Destination",
              icon: Icon(Icons.circle_outlined, size: 30.r, color: Colors.grey),
              onTab: () {
                showFlexibleBottomSheet(
                  minHeight: 0,
                  initHeight: 0.8,
                  maxHeight: 1,
                  context: context,
                  bottomSheetColor: Colors.transparent,
                  barrierColor: Colors.transparent,
                  builder: (context, scrollController, bottomSheetOffset) =>
                      SearchBottomSheet(
                    scrollController: scrollController,
                    searchText: "Destination",
                  ),
                  anchors: [0, 0.5, 1],
                  isSafeArea: true,
                );
              },
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
