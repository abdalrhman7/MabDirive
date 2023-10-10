import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mab_drive/Features/UserHome/ViewModel/cubit/user_home_cubit.dart';

class Mab extends StatelessWidget {
  const Mab({
    super.key,
    required this.cupit,
  });

  final UserHomeCubit cupit;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      zoomControlsEnabled: false,
      initialCameraPosition: cupit.kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        cupit.controller.complete(controller);
        cupit.newGoogleMapController = controller;
      },
    );
  }
}
