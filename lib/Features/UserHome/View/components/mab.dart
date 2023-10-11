import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return SizedBox(
      height: 410.h,
      child: GoogleMap(
        padding: EdgeInsets.only(bottom: 20.h),
        mapType: MapType.hybrid,
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        polylines: cupit.polyLinesSet,
        markers: cupit.markersSet,
        circles: cupit.circlesSet,
        initialCameraPosition: cupit.kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          cupit.controller.complete(controller);
          cupit.newGoogleMapController = controller;
          cupit.locatePosition();
        },
      ),
    );
  }
}
