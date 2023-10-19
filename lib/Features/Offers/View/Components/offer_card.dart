import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/ColorHelper.dart';
import 'package:mab_drive/Core/Database/Firebse/my_database.dart';
import 'package:mab_drive/Core/general_components/main_button.dart';
import 'package:mab_drive/Features/History/Models/history_model.dart';
import 'package:mab_drive/Features/Offers/View/Components/PriceBox.dart';
import 'package:mab_drive/Features/Offers/ViewModel/cubit/ride_offers_cubit.dart';
import 'package:provider/provider.dart';

import '../../../Profile Screen/ViewModel/profile_provider.dart';
import '../../../UserHome/Model/ride_request_model.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.diveOfferPrice,
    required this.requestModel,
    required this.cupit,
    required this.rideId,
  });

  final DiveOfferPrice diveOfferPrice;
  final RideRequestModel requestModel;
  final RideOffersCubit cupit;
  final String rideId;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 330.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.w),
        border: Border.all(color: ColorHelper.mainColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  diveOfferPrice.driverName!,
                  style: const TextStyle(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                SizedBox(
                    height: 40.h,
                    width: 120.w,
                    child: Center(
                        child: PriceBox(
                            price: "\$${diveOfferPrice.offerPrice!}"))),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                SizedBox(
                    width: 100.w,
                    child: MainButton(
                        text: "Deny", color: Colors.red, onTap: () {})),
                const Spacer(),
                SizedBox(
                    width: 100.w,
                    child: MainButton(
                        text: "Accept",
                        onTap: () {
                          addHistory(context);
                          cupit.acceptOffer(
                              offer: diveOfferPrice,
                              rideId: rideId,
                              requestModel: requestModel);
                        })),
              ],
            ),
          ],
        ),
      ),
    );


  }
  void addHistory(BuildContext context)async{

    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    HistoryModel historyModel = HistoryModel(
      driverName:  diveOfferPrice.driverName,
      price: diveOfferPrice.offerPrice,
      destination: requestModel.destinationText
    );
     await MyDataBase.addHistory(authProvider.currentUser?.id??'',
         historyModel);
  }

}
