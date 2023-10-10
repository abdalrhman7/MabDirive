import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
     ProfileTextField({super.key,
      required this.controller,
      required this.icon,
    required this.label,
      required this.onTab
    });
final TextEditingController controller;
    final IconData icon;
    final String label;
    Function() onTab;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      canRequestFocus: false,
      enableInteractiveSelection: false,
      controller: controller,
      readOnly: true,
      style: const TextStyle(color: Color(0xffEDEDED)),
      decoration: InputDecoration(
        suffixIcon:  IconButton(
          onPressed: onTab,
          icon: const Icon(Icons.edit,color: Colors.white)
        ),
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
