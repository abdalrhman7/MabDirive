import 'package:flutter/material.dart';
import 'package:mab_drive/Features/Auth/Register/View/Pages/register_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);
  static const String routeName = 'onboarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff171717),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                Image.asset('Assets/Images/CityDriverPana.png'),
                const Text(
                  'Move with safety',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Get Started',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
