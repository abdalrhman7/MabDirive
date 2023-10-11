import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/general_components/custom_form_field.dart';
import 'package:mab_drive/Features/ride_requests/view/widget/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../../../../Core/Database/Firebse/my_database.dart';
import '../../ViewModel/Profile Cubit/Profile_cubit.dart';
import '../../ViewModel/profile_cubit.dart';
import '../../ViewModel/profile_provider.dart';
import '../Components/profile_text_field.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  static const String routeName = "profile";



  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
@override
  void initState() {

  WidgetsBinding.instance.addPostFrameCallback((timeStamp){
    var userProvider = Provider.of<AuthProvider>(context,listen: false);
    emailController.text = userProvider.email??'dd';
    nameController.text = userProvider.name??'ddd';

  });
  super.initState();


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text('Settings', style: TextStyle(
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
                child: Icon(Icons.person, size: 90.r,),
              ),
              SizedBox(height: 20.h,),
              ProfileTextField(
                onTab: () {},
                controller: nameController,
                label: 'Name',
                icon: Icons.person,
              ),
              SizedBox(height: 20.h,),
              ProfileTextField(
                onTab: () {},
                controller: emailController,
                label: 'Email',
                icon: Icons.email,
              ),

              SizedBox(height: 20.h,),
              ProfileTextField(
                onTab: () {},
                controller: phoneController,
                label: 'Phone',
                icon: Icons.phone,
              ),

              SizedBox(height: 20.h,),
              TextButton.icon(
                icon: const Text('Logout', style: TextStyle(

                    fontSize: 20
                ),),
                label: Icon(Icons.logout),
                onPressed: () {},)
            ],
          ),
        ),
      ),
    );
  }
}
