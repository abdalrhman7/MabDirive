import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
     const ProfileTextField({super.key,
      required this.controller,
      required this.icon,
    required this.label,

    });
final TextEditingController controller;
    final IconData icon;
    final String label;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      canRequestFocus: false,
      enableInteractiveSelection: false,
      controller: controller,
      readOnly: true,
      style: const TextStyle(color: Color(0xffEDEDED)),
      decoration: InputDecoration(
          prefixIcon: Icon(icon,color: Colors.white,),
          //labelText: 'Email',
          label: Text(label,style: const TextStyle(
              color: Colors.white,
              fontSize: 20
          ),),
          //suffixIcon: ,
          hintStyle: const TextStyle(color: Color(0xffEDEDED)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          fillColor: const Color(0xff444444),
          filled: true),
    );
  }
}
