import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:mab_drive/Core/general_components/custom_form_field.dart';
import 'package:mab_drive/Core/my_validators.dart';

import '../../../Phone Verification/View/Pages/phone_verification_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  static const String routeName = "register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Country textCountry = Country.worldWide;
  Country textCountry = Country(
      phoneCode: '20',
      countryCode: 'EG',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'Egypt',
      example: '1001234567',
      displayName: ' Egypt (EG) [+20]',
      displayNameNoCountryCode: '0',
      e164Key: '20-EG-0');

  final TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171717),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff171717),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  'Join us via phone number',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const Text(
                  'We will text a code to verify your phone',
                  style: TextStyle(color: Colors.white60, fontSize: 16),
                ),
                SizedBox(height: 60,),
                CustomFormField(
                    keyboardType: TextInputType.number,
                    prefix: TextButton.icon(
                        onPressed: () {
                          showCountry(context);
                        },
                        icon: Text(
                          textCountry.flagEmoji,
                          style: const TextStyle(fontSize: 30),
                        ),
                        label: Text(
                          '+${textCountry.phoneCode}',
                          style:
                              const TextStyle(color: Colors.white, fontSize: 16),
                        )),
                    hintText: 'Enter Your phone',
                    validator: (text){
                      if(text == null || text.trim().isEmpty){
                        return 'please Enter phone number';
                      }
                      var regex = RegExp(r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$");
                      if(!regex.hasMatch(text)){
                        return 'please enter a valid phone number';
                      }
                    },
                    controller: phoneController),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      register();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        ' Next',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

 void register(){
    if(formKey.currentState?.validate() == false){
      return;
    }
    phoneController.text = '${textCountry.phoneCode}${phoneController.text}';
    Navigator.pushNamed(context, PhoneVerificationScreen.routeName,
    arguments: phoneController.text
    );
  }

  void showCountry(BuildContext context) {
    showCountryPicker(
        context: context,
        countryListTheme: CountryListThemeData(
          flagSize: 25,
          backgroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
          bottomSheetHeight: 500, // Optional. Country list modal height
          //Optional. Sets the border radius for the bottomsheet.
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          //Optional. Styles the search field.
          inputDecoration: InputDecoration(
            labelText: 'Search',
            hintText: 'Start typing to search',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xFF8C98A8).withOpacity(0.2),
              ),
            ),
          ),
        ),
        showPhoneCode: true,
        onSelect: (Country country) {
          setState(() {
            textCountry = country;
          });
        });
  }
}
