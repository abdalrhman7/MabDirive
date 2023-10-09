// ignore_for_file: use_key_in_widget_constructors

import 'package:country_picker/country_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Features/Auth/Login/View/Pages/login_screen.dart';
import 'package:mab_drive/Features/Auth/Register/View/Pages/register_screen.dart';
import 'package:mab_drive/Features/Splash/View/Pages/splash_screen.dart';
import 'package:mab_drive/Features/UserHome/View/user_home.dart';
import 'package:mab_drive/firebase_options.dart';

import 'Core/ColorHelper.dart';
<<<<<<< HEAD
=======
import 'Core/theme_data.dart';
import 'Features/Auth/Phone Verification/View/Pages/phone_verification_screen.dart';
import 'Features/bottom_navigation_bar/screen/bottom_navigation_bar.dart';
>>>>>>> 60e89544656cd975fff49dddc5497d0c45646ecc
import 'Features/onboarding/View/Pages/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorHelper.mainColor),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor:
                const MaterialStatePropertyAll(ColorHelper.mainColor),
            foregroundColor: const MaterialStatePropertyAll(Colors.white),
            overlayColor:
                MaterialStatePropertyAll(Colors.white.withOpacity(.1)),
          ))),
      debugShowCheckedModeBanner: false,
      title: 'MAB Drive',
      initialRoute: SplashScreen.routeName,
      routes: {
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        SplashScreen.routeName: (_) => const SplashScreen(),
        OnBoarding.routeName: (_) => const OnBoarding(),
        UserHome.routeName: (_) => const UserHome(),
      },
=======
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData(context),
        title: 'MAB Drive',
        initialRoute: BottomNavbar.routeName,
        routes: {
          RegisterScreen.routeName: (_) => RegisterScreen(),
          LoginScreen.routeName: (_) => LoginScreen(),
          SplashScreen.routeNmae: (_) => const SplashScreen(),
          OnBoarding.routeName: (_) => const OnBoarding(),
          BottomNavbar.routeName: (_) => const BottomNavbar(),
          // PhoneVerificationScreen.routeName : (_) => PhoneVerificationScreen(),
        },
      ),
>>>>>>> 60e89544656cd975fff49dddc5497d0c45646ecc
    );
  }
}
