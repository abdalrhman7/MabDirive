import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Database/Firebse/firestore_services.dart';
import '../../../UserHome/Model/ride_request_model.dart';

part 'ride_request_state.dart';

class RideRequestCubit extends Cubit<RideRequestState> {
  RideRequestCubit() : super(RideRequestInitial());

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
}
