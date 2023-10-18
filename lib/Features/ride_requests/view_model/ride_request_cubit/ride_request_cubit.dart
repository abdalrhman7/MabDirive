import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mab_drive/Features/Auth/Login/ViewModel/login_cubit.dart';

import '../../../../Core/Database/Firebse/firestore_services.dart';
import '../../../UserHome/Model/ride_request_model.dart';

part 'ride_request_state.dart';

class RideRequestCubit extends Cubit<RideRequestState> {
  RideRequestCubit() : super(RideRequestInitial());
  static RideRequestCubit get(BuildContext context) => BlocProvider.of(context);

  final FirestoreServices firestoreServices = FirestoreServices();

  bool isOffline = true;

  void switchIsOffline() {
    isOffline = !isOffline;
    emit(SwitchIsOfflineState());
    if (isOffline == false) {
      getRequests();
    } else {
      emit(RideRequestInitial());
    }
  }

  void getRequests() {
    emit(RideRequestLoading());
    firestoreServices
        .collectionsStream(
      path: 'RideRequests/',
      builder: (data, docId) => RideRequestModel.fromJson(data!, docId),
    )
        .listen((event) {
      debugPrint('${event[0].docId}++++++++++++++++++++++++++++++++++++++++++');
      emit(RideRequestSuccess(event));
    });
  }

  void addOffer(RideRequestModel rideRequest, String docId) {
    firestoreServices.setData(
        path: 'RideRequests/$docId/', data: rideRequest.toJson());
  }

  void listenOffer({required String rideRequestId}) {
    FirebaseFirestore.instance
        .collection("RideRequests")
        .doc(rideRequestId)
        .snapshots()
        .listen((event) {
      RideRequestModel ride = RideRequestModel.fromJson(event.data()!);
      if (ride.driverId == LoginCubit.user.id) {
        emit(YourOfferAcceptedState(requestModel: ride));
      }
    });
  }
}
