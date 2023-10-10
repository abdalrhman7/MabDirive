import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/general_components/CustomCircularProgressIndicator.dart';
import '../../model/ride_request.dart';
import '../../view_model/ride_request_cubit/ride_request_cubit.dart';
import 'customer_request_card.dart';

class RideRequestStreamBuilder extends StatelessWidget {
  const RideRequestStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<RideRequest>>(
        stream: BlocProvider.of<RideRequestCubit>(context).rideRequestStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final requests = snapshot.data;
            if (requests == null || requests.isEmpty) {
              return const Center(
                child: Text('No Requests Available'),
              );
            }
            return ListView.builder(
              itemCount: requests.length,
              itemBuilder: (context, index) =>
                  CustomerRequestCard(rideRequest: requests[index]),
            );
          }
          return const CustomCircularProgressIndicator();
        },
      ),
    );
  }
}