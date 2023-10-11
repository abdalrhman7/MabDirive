
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../Core/Database/Firebse/my_database.dart';
import '../../Auth/Login/Models/user.dart' as MyUser;

class AuthProvider extends ChangeNotifier{
  MyUser.User? currentUser;
String? name;
String? email;


  void logout(){
    FirebaseAuth.instance
        .signOut();
    currentUser = null;
  }

   getUserFromDataBase()async{
    var user = await MyDataBase.readUser(FirebaseAuth.instance.currentUser?.uid ??"");
    currentUser = user;
    name = user?.name??"mm";
    email = user?.email??'eee';
    print( email);
    print( name);
  }

}
