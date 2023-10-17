import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/ColorHelper.dart';
import 'package:mab_drive/Features/Auth/Login/ViewModel/login_cubit.dart';
import 'package:mab_drive/Features/ride_requests/view_model/ride_request_cubit/ride_request_cubit.dart';

import '../../../../Core/general_components/main_button.dart';
import '../../../UserHome/Model/ride_request_model.dart';
import '../../../UserHome/View/components/mab.dart';
import '../../../UserHome/ViewModel/cubit/user_home_cubit.dart';

Future customerRequestDetailsDialog({
  required BuildContext context,
  required RideRequestModel rideRequest,
}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Request',
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          height: 0.85.sh,
          width: 0.90.sh,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12.w)),
          child: Scaffold(
              body: SingleChildScrollView(
            child: CustomerRequestDetails(
              rideRequest: rideRequest,
            ),
          )),
        ),
      );
    },
  );
}

class CustomerRequestDetails extends StatefulWidget {
  const CustomerRequestDetails({super.key, required this.rideRequest});

  final RideRequestModel rideRequest;

  @override
  State<CustomerRequestDetails> createState() => _CustomerRequestDetailsState();
}

class _CustomerRequestDetailsState extends State<CustomerRequestDetails> {
  late final TextEditingController offerController;
  @override
  void initState() {
    // TODO: implement initState
    offerController =
        TextEditingController(text: widget.rideRequest.targetPrice);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = UserHomeCubit.get(context);
    late RideRequestModel requestModel;
    return BlocProvider(
      create: (context) => RideRequestCubit(),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          children: [
            SizedBox(
              height: 0.45.sh,
              child: Mab(cupit: cubit),
            ),
            SizedBox(height: 30.h),
            MainButton(
              text: 'Agreed for ${widget.rideRequest.targetPrice} EGP',
              onTap: () {
                requestModel = widget.rideRequest.copyWith(
                  offers: [
                    DiveOfferPrice(
                      driverPhone: LoginCubit.user.phone,
                      driverName: LoginCubit.user.name,
                      driverId: LoginCubit.user.id,
                      offerPrice: widget.rideRequest.targetPrice,
                    )
                  ],
                );
                setState(() {});
                BlocProvider.of<RideRequestCubit>(context)
                    .addOffer(requestModel, widget.rideRequest.docId!);
                Navigator.of(context).pop();
              },
              color: ColorHelper.greenColor,
            ),
            SizedBox(height: 10.h),
            Text(
              'offer your price :',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            TextFormField(
              controller: offerController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Your offer',
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12.w)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12.w)),
              ),
            ),
            SizedBox(height: 10.h),
            Builder(builder: (context) {
              return MainButton(
                text: 'Send offer',
                onTap: () {
                  requestModel = widget.rideRequest.copyWith(
                    offers: [
                      DiveOfferPrice(
                        driverName: LoginCubit.user.name,
                        driverId: LoginCubit.user.id,
                        offerPrice: offerController.text,
                        driverPhone: '',
                      )
                    ],
                  );
                  setState(() {});
                  BlocProvider.of<RideRequestCubit>(context)
                      .addOffer(requestModel, widget.rideRequest.docId!);
                  Navigator.of(context).pop();
                },
                color: ColorHelper.greenColor,
              );
            })
          ],
        ),
      ),
    );
  }
}

// RideRequestModel requestModel = RideRequestModel(
//     dateTime: DateTime.now.toString(),
//     destinationText: 'ay hage ',
//     pickUpText: ' ',
//     rideType: 'zz',
//     targetPrice: '02',
//     offers: [
//       DiveOfferPrice(
//         driverName: 'abdalrhman',
//         driverId: rideRequest.driverId,
//         offerPrice: _offerController.text,
//       ),
//     ]);
//
// BlocProvider.of<RideRequestCubit>(context)
// .addOffer(requestModel);
