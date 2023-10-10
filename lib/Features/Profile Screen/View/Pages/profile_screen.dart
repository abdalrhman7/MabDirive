import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/general_components/custom_form_field.dart';
import 'package:mab_drive/Features/ride_requests/view/widget/custom_app_bar.dart';

import '../Components/profile_text_field.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
static const String routeName = "profile";
final TextEditingController nameController = TextEditingController(text: 'Messi');
   final TextEditingController emailController = TextEditingController(text: 'messi10@fifa.com');
   final TextEditingController phoneController = TextEditingController(text: 'messi10@fifa.com');

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        title: const Text('Settings',style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              CircleAvatar(
                radius: 50.r,
                child: Icon(Icons.person,size: 90.r,),
              ),
              SizedBox(height: 20.h,),
              ProfileTextField(
                onTab: (){},
                controller: nameController,
                label: 'Name',
                icon: Icons.person,
              ),
             SizedBox(height: 20.h,),
              ProfileTextField(
                onTab: (){},
                controller: emailController,
                label: 'Email',
                icon: Icons.email,
              ),

              SizedBox(height: 20.h,),
              ProfileTextField(
                onTab: (){},
                controller: phoneController,
                label: 'Phone',
                icon: Icons.phone,
              ),

              SizedBox(height: 20.h,),
              TextButton.icon(
                icon: const Text('Logout',style: TextStyle(

                    fontSize: 20
                ),),
                  label: Icon(Icons.logout),
                  onPressed: (){}, )
            ],
          ),
        ),
      ),
    );
  }
}
