import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/ColorHelper.dart';
import 'package:mab_drive/Features/Offers/View/Components/offer_card.dart';
import 'package:mab_drive/Features/Offers/ViewModel/cubit/ride_offers_cubit.dart';

class RideOffersPage extends StatelessWidget {
  const RideOffersPage({super.key, required this.rideRequestId});
  final String rideRequestId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Offers",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: ColorHelper.mainColor,
      ),
      backgroundColor: ColorHelper.darkColor,
      body: BlocProvider(
        create: (context) => RideOffersCubit()..getDriversOffers(rideRequestId),
        child: BlocConsumer<RideOffersCubit, RideOffersState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cupit = RideOffersCubit.get(context);
            return ListView.separated(
                itemBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: OfferCard(),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                itemCount: 10);
          },
        ),
      ),
    );
  }
}
