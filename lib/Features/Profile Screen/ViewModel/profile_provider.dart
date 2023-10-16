import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mab_drive/Features/Auth/Login/ViewModel/login_cubit.dart';

import '../../../Core/Database/Firebse/my_database.dart';
import '../../Auth/Login/Models/user.dart' as MyUser;

class AuthProvider extends ChangeNotifier {
  MyUser.UserModel? currentUser;
  String? name;
  String? email;

  void logout() {
    FirebaseAuth.instance.signOut();
    currentUser = null;
  }

  getUserFromDataBase() async {
    var user =
        await MyDataBase.readUser(FirebaseAuth.instance.currentUser?.uid ?? "");
    LoginCubit.user = user!;
    name = user.name ?? "mm";
    email = user.email ?? 'eee';
    print(email);
    print(name);
  }
}
