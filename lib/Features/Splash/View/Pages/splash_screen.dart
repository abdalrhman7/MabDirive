import 'package:flutter/material.dart';
import 'package:mab_drive/Features/Auth/Register/View/Pages/register_screen.dart';

import '../../../Auth/Login/ViewModel/login_cubit.dart';
import '../../../UserHome/View/pages/user_home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
        context,
        (LoginCubit.uid != '') ? UserHome.routeName : RegisterScreen.routeName,
      );
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
