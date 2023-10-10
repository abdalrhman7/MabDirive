import 'package:bloc/bloc.dart';
import 'package:mab_drive/Features/ride_requests/model/ride_request.dart';
import 'package:meta/meta.dart';

import '../../../../Core/Database/Firebse/firestore_services.dart';

part 'ride_request_state.dart';

class RideRequestCubit extends Cubit<RideRequestState> {
  RideRequestCubit() : super(RideRequestInitial());

  final FirestoreServices firestoreServices = FirestoreServices();

  Stream<List<RideRequest>> rideRequestStream() {
    return firestoreServices.collectionsStream(
        path: 'request/',
        builder: (data) => RideRequest.fromMap(data!),
      );
  }
}
