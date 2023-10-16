import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mab_drive/Features/UserHome/Model/ride_request_model.dart';

part 'ride_offers_state.dart';

class RideOffersCubit extends Cubit<RideOffersState> {
  RideOffersCubit() : super(RideOffersInitial());
  static RideOffersCubit get(BuildContext context) => BlocProvider.of(context);
  @override
  void onChange(Change<RideOffersState> change) {
    super.onChange(change);
    debugPrint(change.toString());
    debugPrint(change.currentState.toString());
    debugPrint(change.nextState.toString());
  }

  List<DiveOfferPrice> driverOffers = [];

  getDriversOffers(String rideId) {
    FirebaseFirestore.instance
        .collection("RideRequests")
        .doc(rideId)
        .snapshots()
        .listen((event) {
      RideRequestModel ride = RideRequestModel.fromJson(event.data()!);
      driverOffers = ride.offers;
      emit(GetOffersSuccessState());
    });
  }

  acceptOffer(
      {required DiveOfferPrice offer,
      required String rideId,
      required RideRequestModel requestModel}) {
    requestModel.driverId = offer.driverId!;
    FirebaseFirestore.instance
        .collection("RideRequests")
        .doc(rideId)
        .update(requestModel.toJson())
        .then((value) {
      emit(AcceptOfferSuccessState());
    }).catchError((onError) {
      emit(AcceptOfferErrorState());
    });
  }
}
