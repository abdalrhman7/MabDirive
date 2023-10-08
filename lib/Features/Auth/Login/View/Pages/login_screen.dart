import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mab_drive/Features/Auth/Register/View/Pages/register_screen.dart';

import '../../../../../Core/general_components/build_show_toast.dart';
import '../../../../../Core/general_components/custom_form_field.dart';
import '../../../../../Core/my_validators.dart';
import '../../ViewModel/login_cubit.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
static const String routeName = "login";
  final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
   final formKey = GlobalKey<FormState>();
LoginCubit loginCubit = LoginCubit();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171717),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff171717),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(height: 40,),

              CustomFormField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Enter Your Email',
                  validator: (value) => MyValidators.emailValidator(value),
                  controller: emailController),
              SizedBox(height: 20,),
              CustomFormField(
                  hintText: 'Enter Your password',
                  validator: (value) => MyValidators.passwordValidator(value),
                  controller: passwordController),

              SizedBox(
                height: 40,
              ),
              BlocConsumer<LoginCubit, LoginState>(
                bloc: loginCubit,
                listener: (context, state) {
                },
                builder: (context, state) {
                  if(state is LoginLoading){
                    return Center(child: CircularProgressIndicator());
                  }
                  else if(state is LoginError){
                    buildShowToast(state.message);
                  }
                  else if(state is LoginSuccess){
                    buildShowToast(state.message);
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            ' Next',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  );
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have an Account ? " ,
                    style: TextStyle(
                      color:Color(0xffEDEDED),
                    ),
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                      },
                      child: Text("Register")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  login()async{
    if(formKey.currentState?.validate() == false) {
      return;
    }
    loginCubit.login(
        email: emailController.text,
        password: passwordController.text);
  }
}
