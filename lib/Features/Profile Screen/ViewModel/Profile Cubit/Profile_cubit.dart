import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Database/Firebse/my_database.dart';
import '../../../Auth/Login/Models/user.dart' as MyUser;

class ProfileCubiit extends Cubit {
  ProfileCubiit(super.initialState);
  static MyUser.UserModel? currentUser;

  static ProfileCubiit get(BuildContext context) => BlocProvider.of(context);

  Future<MyUser.UserModel?> getUserFromDataBase() async {
    var user =
        await MyDataBase.readUser(FirebaseAuth.instance.currentUser?.uid ?? "");
    currentUser = user;
    return user;
  }
}
