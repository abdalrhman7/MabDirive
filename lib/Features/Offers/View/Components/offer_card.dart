import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/ColorHelper.dart';
import 'package:mab_drive/Core/general_components/main_button.dart';
import 'package:mab_drive/Features/Offers/View/Components/PriceBox.dart';

import '../../../UserHome/Model/ride_request_model.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key, required this.diveOfferPrice,
  });

  final DiveOfferPrice diveOfferPrice;
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
        padding: const EdgeInsets.all(8.0),
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
                    width: 70.w,
                    child:  PriceBox(price: diveOfferPrice.offerPrice!)),
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
                    child: MainButton(text: "Accept", onTap: () {})),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
