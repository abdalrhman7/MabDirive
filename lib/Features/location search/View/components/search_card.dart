import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Features/UserHome/ViewModel/cubit/user_home_cubit.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
    required this.cupit,
    required this.index,
  });

  final UserHomeCubit cupit;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cupit
              .searchLocationPredictions[index].structuredFormatting!.mainText!,
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
        Text(
            cupit.searchLocationPredictions[index].structuredFormatting!
                .secondaryText!,
            style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
      ],
    );
  }
}
