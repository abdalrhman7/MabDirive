import 'package:flutter/material.dart';
import 'package:mab_drive/Features/onboarding/View/Pages/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
static const String routeNmae = 'splash';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, OnBoarding.routeName);
    });
    return const Scaffold(
      backgroundColor: Color(0xff171717),
      body: Center(
        child: Text('MAB Drive',style: TextStyle(
          color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
