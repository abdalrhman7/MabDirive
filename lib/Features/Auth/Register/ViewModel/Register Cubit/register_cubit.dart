import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  FirebaseAuth auth = FirebaseAuth.instance;
late String verfId;

  register()async{
    emit(RegisterLoading());
    try{
       await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+20 01111269525',
        verificationCompleted: (PhoneAuthCredential credential) {
        },
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) async{
          verfId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      emit(RegisterSuccess('success'));
    }on FirebaseAuthException catch (e) {
      emit(RegisterError('ERROR$e'));
    }
  }

  sendCode(String smsCode)async{
    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verfId,
          smsCode: smsCode
      );
      await auth.signInWithCredential(credential);
    }on TimeoutException catch (ex) {
      emit(RegisterError('Please Check Your Internet\n $ex'));
    } catch (ex) {
      print(ex);
      emit(RegisterError('$ex'));
    }
  }
}
