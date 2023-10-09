import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../Core/Database/Firebse/my_database.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  FirebaseAuth authService = FirebaseAuth.instance;

  login({required String email ,required String password})async{
    emit(LoginLoading());
    try{
      var result = await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
       await MyDataBase.readUser(result.user?.uid ?? "");
      emit(LoginSuccess('Success'));
    }on FirebaseAuthException catch (e) {

      String errorMessage = 'Something Went Wrong';
      if (e.code == 'user-not-found') {
        String errorMessage = 'User-not-found.';
        emit(LoginError(errorMessage));
      } else if (e.code == 'wrong-password') {
        String errorMessage = 'wrong-password.';
        emit(LoginError(errorMessage));
      }
      emit(LoginError(e.code));
    } catch (e) {
      String errorMessage = 'Something Went Wrong$e';
      emit(LoginError(errorMessage));
    }
  }
}
