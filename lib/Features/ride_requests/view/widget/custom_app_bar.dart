

import 'package:flutter/material.dart';
import 'package:mab_drive/Features/ride_requests/view/widget/switch_button_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        const SwitchButtonWidget(),
        const Icon(Icons.settings , color: Colors.white)
      ],
    );
  }
}