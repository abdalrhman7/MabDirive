class RideRequestModel {
  // LatLanModel? pickUpLatLan;
  // LatLanModel? destinationLatLan;
  String? destinationText;
  String? pickUpText;
  String? targetPrice;
  String? dateTime;
  String? rideType;
  String driverId = "Waiting";
  List<DiveOfferPrice> offers = [];

  RideRequestModel({
    //  required this.destinationLatLan,
    required this.destinationText,
    required this.pickUpText,
    // required this.pickUpLatLan,
    required this.targetPrice,
    required this.rideType,
    required this.dateTime,
  });

  RideRequestModel.fromJson(Map<String, dynamic> json) {
    destinationText = json['destinationText'];
    pickUpText = json['pickUpText'];
    dateTime = json['dateTime'];
    rideType = json['rideType'];
    driverId = json['driverId'];
    targetPrice = json['targetPrice'];
    if (json['offers'] != null) {
      offers = List<DiveOfferPrice>.from(
          json['offers'].map((offer) => DiveOfferPrice.fromJson(offer)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destinationText'] = destinationText;
    data['pickUpText'] = pickUpText;
    data['dateTime'] = dateTime;
    data['rideType'] = rideType;
    data['targetPrice'] = targetPrice;
    data['driverId'] = driverId;
    data['offers'] = offers.map((offer) => offer.toJson()).toList();
    return data;
  }
}

class LatLanModel {
  String? latitude;
  String? longitude;

  LatLanModel({required this.latitude, required this.longitude});

  LatLanModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class DiveOfferPrice {
  String? driverName;
  String? driverId;
  String? offerPrice;

  DiveOfferPrice({
    required this.driverName,
    required this.driverId,
    required this.offerPrice,
  });

  DiveOfferPrice.fromJson(Map<String, dynamic> json) {
    driverName = json['driverName'];
    driverId = json['driverId'];
    offerPrice = json['offerPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['driverName'] = driverName;
    data['driverId'] = driverId;
    data['offerPrice'] = offerPrice;
    return data;
  }
}
