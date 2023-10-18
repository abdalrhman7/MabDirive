import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/ColorHelper.dart';
import 'package:mab_drive/Features/UserHome/Model/ride_request_model.dart';
import 'package:mab_drive/Features/UserHome/View/components/mab.dart';
import 'package:mab_drive/Features/UserHome/ViewModel/cubit/user_home_cubit.dart';

class GoToCustomerPage extends StatelessWidget {
  const GoToCustomerPage({super.key, required this.rideRequestModel});
  final RideRequestModel rideRequestModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeCubit()..locatePosition(),
      child: BlocConsumer<UserHomeCubit, UserHomeState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is GetCurrentLocationSussesState) {
            UserHomeCubit.get(context)
                .getDirections(destination: rideRequestModel.pickUpText);
          }
        },
        builder: (context, state) {
          var cupit = UserHomeCubit.get(context);

          return Scaffold(
            body: SizedBox(
              height: 690.h,
              child: Stack(
                children: [
                  Mab(cupit: cupit, height: 600),
                  GoToCustomerText(
                    cupit: cupit,
                    rideRequestModel: rideRequestModel,
                  ),
                  Positioned(
                    bottom: 70.h,
                    right: 20.w,
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.4),
                      minRadius: 22.r,
                      child: IconButton(
                        onPressed: () {
                          cupit.locatePosition();
                        },
                        icon: Icon(
                          Icons.my_location_sharp,
                          color: Colors.white,
                          size: 22.r,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class GoToCustomerText extends StatefulWidget {
  const GoToCustomerText(
      {super.key, required this.cupit, required this.rideRequestModel});
  final UserHomeCubit cupit;
  final RideRequestModel rideRequestModel;
  @override
  State<GoToCustomerText> createState() => _GoToCustomerTextState();
}

class _GoToCustomerTextState extends State<GoToCustomerText> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 65.h,
        width: 360.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorHelper.darkColor),
        child: const Center(
          child: Text(
            "Go to Customer",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
