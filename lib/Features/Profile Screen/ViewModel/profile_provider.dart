import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mab_drive/Features/Auth/Login/ViewModel/login_cubit.dart';

import '../../../Core/Database/Firebse/my_database.dart';
import '../../Auth/Login/Models/user.dart' as MyUser;

class AuthProvider extends ChangeNotifier {
  MyUser.UserModel? currentUser;
  String? name;
  String? email;
  String? phone;

  void updateUser(MyUser.UserModel loggedInUser){
    currentUser = loggedInUser;
    notifyListeners();
  }
  void logout() async{
    FirebaseAuth.instance.signOut();

    LoginCubit.user.id = '';
    await const FlutterSecureStorage().delete(key: 'token');
    currentUser = null;
  }

  getUserFromDataBase() async {
    var user =
        await MyDataBase.readUser(FirebaseAuth.instance.currentUser?.uid ?? "");
    LoginCubit.user = user!;
    name = user.name ?? "";
    email = user.email ?? '';
    phone = user.phone??'';
    print(email);
    print(name);
  }
}
