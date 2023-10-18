import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/general_components/build_show_toast.dart';
import 'package:mab_drive/Features/ride_requests/view/pages/go_to_castomer_screen.dart';

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
      child: BlocConsumer<RideRequestCubit, RideRequestState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is YourOfferAcceptedState) {
            buildShowToast('Your offer Accepted');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      GoToCustomerPage(rideRequestModel: state.requestModel),
                ));
          }
        },
        builder: (context, state) {
          var cupit = RideRequestCubit.get(context);
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Stack(
                children: [
                  Column(
                    children: [
                      const CustomAppBar(),
                      SizedBox(height: 18.h),
                      const SendOffersWidget(),
                      RideRequestStreamBuilder(
                        cupit: cupit,
                      ),
                      SizedBox(height: 12.h),
                    ],
                  ),
                  const CustomFloatingActionButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
