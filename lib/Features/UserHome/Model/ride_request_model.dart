class RideRequestModel {
  // LatLanModel? pickUpLatLan;
  // LatLanModel? destinationLatLan;
  String? destinationText;
  String? picUpText;
  String? targetPrice;
  String? dateTime;
  String? rideType;
  String driverId = "Waiting";
  List<DiveOfferPrice> offers = [];

  RideRequestModel({
    //  required this.destinationLatLan,
    required this.destinationText,
    required this.picUpText,
    // required this.pickUpLatLan,
    required this.targetPrice,
    required this.rideType,
    required this.dateTime,
  });
  RideRequestModel.fromJson(Map<String, dynamic> json) {
    destinationText = json['destinationText'];
    picUpText = json['picUpText'];
    dateTime = json['dateTime'];
    dateTime = json['rideType'];
    driverId = json['driverId'];
    targetPrice = json['targetPrice'];
    // pickUpLatLan = LatLanModel.fromJson(json['pickUpLatLan']);
    // destinationLatLan = LatLanModel.fromJson(json['destinationLatLan']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    // data['pickUpLatLan'] = pickUpLatLan!.toJson();
    // data['destinationLatLan'] = destinationLatLan!.toJson();
    data['destinationText'] = destinationText;
    data['picUpText'] = picUpText;
    data['dateTime'] = dateTime;
    data['targetPrice'] = targetPrice;
    data['driverId'] = driverId;
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
  DiveOfferPrice(
      {required this.driverName,
      required this.driverId,
      required this.offerPrice});

  DiveOfferPrice.fromJson(Map<String, dynamic> json) {
    driverName = json['driverName'];
    driverId = json['driverId'];
    offerPrice = json['offerPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['offerPrice'] = offerPrice;
    data['driverId'] = driverId;
    data['offerPrice'] = offerPrice;
    return data;
  }
}
