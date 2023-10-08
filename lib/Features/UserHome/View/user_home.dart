import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mab_drive/Features/UserHome/ViewModel/cubit/user_home_cubit.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});
  static String routeName = "user_home_screen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeCubit(),
      child: BlocConsumer<UserHomeCubit, UserHomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cupit = UserHomeCubit.get(context);
          return Scaffold(
            body: Stack(children: [
              GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: cupit.kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  cupit.controller.complete(controller);
                  cupit.newGoogleMapController = controller;
                },
              )
            ]),
          );
        },
      ),
    );
  }
}
