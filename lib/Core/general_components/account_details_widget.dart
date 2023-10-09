import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountDetailsWidget extends StatelessWidget {
  const AccountDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          const CircleAvatar(backgroundColor: Colors.blueAccent, maxRadius: 22),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp)),
              RatingBar.builder(
                itemSize: 16.0,
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {},
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_sharp,
            color: Colors.white,
            size: 18,
          )
        ],
      ),
    );
  }
}
