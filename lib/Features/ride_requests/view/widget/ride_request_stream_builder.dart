import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/general_components/CustomCircularProgressIndicator.dart';
import '../../view_model/ride_request_cubit/ride_request_cubit.dart';
import 'customer_request_card.dart';

class RideRequestStreamBuilder extends StatelessWidget {
  const RideRequestStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RideRequestCubit, RideRequestState>(
      buildWhen: (previous, current) =>
          previous != current && current is RideRequestSuccess ||
          previous != current && current is RideRequestInitial,
      builder: (context, state) {
        if (state is RideRequestInitial) {
          return Center(
            child: Text(
              'Switch to online to get requests',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          );
        }
        if (state is RideRequestSuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.requests.length,
              itemBuilder: (context, index) =>
                  CustomerRequestCard(rideRequest: state.requests[index]),
            ),
          );
        }
        return const CustomCircularProgressIndicator();
      },
    );
  }
}
