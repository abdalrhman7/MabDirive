import 'package:flutter/material.dart';
import 'package:mab_drive/Features/ride_requests/view/pages/ride_requests_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RideRequestsScreen.routeName);
    });
    return const Scaffold(
      backgroundColor: Color(0xff171717),
      body: Center(
        child: Text(
          'MAB Drive',
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
