import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/ColorHelper.dart';
import 'package:mab_drive/Core/general_components/defult_text_form_field.dart';
import 'package:mab_drive/Core/general_components/main_button.dart';
import 'package:mab_drive/Features/UserHome/ViewModel/cubit/user_home_cubit.dart';

class PriceBottomSheet extends StatelessWidget {
  PriceBottomSheet({super.key, required this.scrollController});
  final ScrollController scrollController;
  final TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: BlocConsumer<UserHomeCubit, UserHomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cupit = UserHomeCubit.get(context);
            return Container(
              decoration: BoxDecoration(
                  color: ColorHelper.darkColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  defaultTextFormFelid(
                      controller: priceController,
                      text: "Offer your fare",
                      prefixIcon: const Icon(
                        Icons.price_change,
                        color: Colors.white,
                      ),
                      fillColor: Colors.white),
                  Padding(
                    padding: EdgeInsets.all(12.r),
                    child: MainButton(
                      text: "Set new Price",
                      onTap: () {
                        Navigator.pop(context);
                        cupit.setTripPrice(priceController.text);
                      },
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
