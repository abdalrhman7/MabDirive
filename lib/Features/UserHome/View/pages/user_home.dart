import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/general_components/app_drawer.dart';
import 'package:mab_drive/Features/Offers/View/Pages/ride_offers_page.dart';
import 'package:mab_drive/Features/UserHome/View/components/drawer_button.dart';
import 'package:mab_drive/Features/UserHome/View/components/mab.dart';
import 'package:mab_drive/Features/UserHome/View/components/user_home_lower_part.dart';
import 'package:mab_drive/Features/UserHome/ViewModel/cubit/user_home_cubit.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});
  static String routeName = "user_home_screen";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserHomeCubit, UserHomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AddRequestSussesState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RideOffersPage(
                    rideRequestId: state.rideRequestId,
                    rideRequestModel: state.requestModel),
              ));
        }
      },
      builder: (context, state) {
        var cupit = UserHomeCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: const AppDrawer(currentPage: "UserHome"),
          body: SizedBox(
            height: 690.h,
            child: Stack(children: [
              Mab(cupit: cupit),
              const CustomDrawerButton(),
              Positioned(
                top: 30.h,
                right: 20.w,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.4),
                  minRadius: 22.r,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 22.r,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 310.h,
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
              Positioned(
                bottom: 0,
                child: UserHomeLowerPart(
                  cupit: cupit,
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
