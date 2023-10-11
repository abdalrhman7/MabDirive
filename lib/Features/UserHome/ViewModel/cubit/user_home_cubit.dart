import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mab_drive/Core/ColorHelper.dart';
import 'package:mab_drive/Core/Database/remote/DioHelper/dio_helper.dart';
import 'package:mab_drive/Core/configure_maps.dart';
import 'package:mab_drive/Features/UserHome/Model/direction_model.dart'
    hide Polyline;
import 'package:mab_drive/Features/UserHome/Model/ride_request_model.dart';
import 'package:mab_drive/Features/location%20search/Model/search_prediction_model.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit() : super(UserHomeInitial());
  static UserHomeCubit get(BuildContext context) => BlocProvider.of(context);
  @override
  void onChange(Change<UserHomeState> change) {
    super.onChange(change);
    debugPrint(change.toString());
    debugPrint(change.currentState.toString());
    debugPrint(change.nextState.toString());
  }

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  late GoogleMapController newGoogleMapController;
  late Position currentPosition;
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Geolocator.openLocationSettings().then((value) {
        if (!value) {
          return Future.error('Location services are disabled.');
        }
      });
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  String? priceOfTrip;
  String? pickupLocationAddress;
  String? destinationLocationAddress;
  void locatePosition() async {
    currentPosition = await determinePosition();
    LatLng latLngPosition =
        LatLng(currentPosition.latitude, currentPosition.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 17);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    placemarkFromCoordinates(
            currentPosition.latitude, currentPosition.longitude)
        .then((value) {
      pickupLocationAddress = "${value.first.street}";
      debugPrint(pickupLocationAddress);
      emit(GetCurrentLocationSussesState());
    });
  }

  List<SearchLocationPrediction> searchLocationPredictions = [];
  void searchLocation(String searchKey) async {
    searchLocationPredictions = [];
    DioHelper.getData(
        url: "https://maps.googleapis.com/maps/api/place/autocomplete/json",
        queryParameters: {
          "input": searchKey,
          "location":
              "${currentPosition.latitude}%2C${currentPosition.longitude}",
          "radius": 500,
          "components": "country:eg",
          "types": "establishment",
          "key": mapAndroidKey,
        }).then((value) {
      for (var element in value.data["predictions"]) {
        searchLocationPredictions
            .add(SearchLocationPrediction.fromJson(element));
      }
      emit(SearchLocationSussesState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(SearchLocationErrorState());
    });
  }

  setDestination(String destination) {
    destinationLocationAddress = destination;
    if (pickupLocationAddress != null) {
      getDirections();
    }
    emit(SetDestinationSussesState());
  }

  setPickup(String pickup) {
    pickupLocationAddress = pickup;
    if (destinationLocationAddress != null) {
      getDirections();
    }
    emit(SetDestinationSussesState());
  }

  setTripPrice(String price) {
    priceOfTrip = price;
    emit(SetPriceSussesState());
  }

  Set<Polyline> polyLinesSet = {};
  Set<Circle> circlesSet = {};
  Set<Marker> markersSet = {};
  late DirectionModel directions;
  void getDirections() {
    polyLinesSet.clear();
    PolylinePoints polylinePoints = PolylinePoints();
    DioHelper.getData(
        url: "https://maps.googleapis.com/maps/api/directions/json",
        queryParameters: {
          "destination": pickupLocationAddress,
          "origin": destinationLocationAddress,
          "key": mapAndroidKey,
        }).then((value) {
      directions = DirectionModel.fromJson(value.data);

      debugPrint(value.data.toString());
      if (directions.routes!.isNotEmpty) {
        priceOfTrip =
            "${directions.routes!.first.legs!.first.distance!.value! / 200}";
        List<LatLng> plainCoordinates = [];
        List<PointLatLng> result = polylinePoints
            .decodePolyline(directions.routes!.first.overviewPolyline!.points!);
        for (var element in result) {
          LatLng tempLatLngPosition =
              LatLng(element.latitude, element.longitude);
          plainCoordinates.add(tempLatLngPosition);
        }
        CameraPosition cameraPosition =
            CameraPosition(target: plainCoordinates.last, zoom: 17);
        newGoogleMapController.animateCamera(CameraUpdate.newLatLngBounds(
            LatLngBounds(
                southwest: plainCoordinates.first,
                northeast: plainCoordinates.last),
            70));
        polyLinesSet.add(Polyline(
          polylineId: const PolylineId("PolylineId"),
          jointType: JointType.round,
          points: plainCoordinates,
          color: ColorHelper.mainColor,
          width: 5,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          geodesic: true,
        ));

        markersSet.add(Marker(
            markerId: const MarkerId("pickupMarker"),
            position: plainCoordinates.last,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
            infoWindow: InfoWindow(
                title: pickupLocationAddress, snippet: "My location")));
        markersSet.add(Marker(
            markerId: const MarkerId("destinationMarker"),
            position: plainCoordinates.first,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueMagenta),
            infoWindow: InfoWindow(
                title: destinationLocationAddress, snippet: "Destination")));
      }
      emit(GetDirectionSussesState());
    }).catchError((onError) {
      emit(GetDirectionErrorState());
    });
  }

  void addRequest({required String rideType}) {
    RideRequestModel rideRequestModel = RideRequestModel(
        destinationText: destinationLocationAddress,
        pickUpText: pickupLocationAddress,
        rideType: rideType,
        dateTime: DateTime.now().toString(),
        targetPrice: priceOfTrip);
    FirebaseFirestore.instance
        .collection("RideRequests")
        .add(rideRequestModel.toJson())
        .then((value) {
      debugPrint(value.id);
      emit(AddRequestSussesState(rideRequestId: value.id));
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(AddRequestErrorState());
    });
  }
}
