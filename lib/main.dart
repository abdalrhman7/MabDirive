// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/Database/remote/DioHelper/dio_helper.dart';
import 'package:mab_drive/Features/Auth/Login/View/Pages/login_screen.dart';
import 'package:mab_drive/Features/Auth/Register/View/Pages/register_screen.dart';
import 'package:mab_drive/Features/History/View/Pages/history_screen.dart';
import 'package:mab_drive/Features/Profile%20Screen/View/Pages/profile_screen.dart';
import 'package:mab_drive/Features/Splash/View/Pages/splash_screen.dart';
import 'package:mab_drive/Features/UserHome/View/pages/user_home.dart';
import 'package:mab_drive/firebase_options.dart';

import 'Core/theme_data.dart';
import 'Features/UserHome/ViewModel/cubit/user_home_cubit.dart';
import 'Features/bottom_navigation_bar/screen/bottom_navigation_bar.dart';
import 'Features/onboarding/View/Pages/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => UserHomeCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeData(context),
          title: 'MAB Drive',
          initialRoute: UserHome.routeName,
          routes: {
            RegisterScreen.routeName: (_) => RegisterScreen(),
            LoginScreen.routeName: (_) => LoginScreen(),
            SplashScreen.routeName: (_) => const SplashScreen(),
            OnBoarding.routeName: (_) => const OnBoarding(),
            DriverBottomNavbar.routeName: (_) => const DriverBottomNavbar(),
            UserHome.routeName: (_) => const UserHome(),
            ProfileScreen.routeName: (_) => ProfileScreen(),
            HistoryScreen.routeName: (_) => const HistoryScreen(),
          },
        ),
      ),
    );
  }
}
