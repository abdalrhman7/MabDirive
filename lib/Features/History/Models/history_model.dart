class HistoryModel{
  static const String collectionName = 'history';
  String? driverName;
  String? price;
  String? destination;
  String? id;
  HistoryModel({this.price,this.driverName,this.destination,this.id});
  HistoryModel.fromFireStore(Map<String, dynamic>? data)
      : this(
      driverName: data?['driverName'],
      price: data?['price'],
      destination: data?['destination'],
    id: data?['id'],
  );

  Map<String, dynamic> toFireStore() {
    return {'driverName': driverName, 'price': price, 'destination': destination,'id' : id};
  }
}