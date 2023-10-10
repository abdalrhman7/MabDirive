import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/ride_request_cubit/ride_request_cubit.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_floating_action_button.dart';
import '../widget/ride_request_stream_builder.dart';
import '../widget/send_offers_widget.dart';

class RideRequestsScreen extends StatelessWidget {
  const RideRequestsScreen({super.key});

  static String routeName = "RideRequestsScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RideRequestCubit(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Stack(
            children: [
              Column(
                children: [
                  const CustomAppBar(),
                  SizedBox(height: 18.h),
                  const SendOffersWidget(),
                  const RideRequestStreamBuilder(),
                  SizedBox(height: 12.h),
                ],
              ),
              const CustomFloatingActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}


