import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
   HistoryItem({super.key,
  required this.price,
    required this.driverName,
    required this.from,
    required this.to
  });
String driverName;
String from;
String to;
String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color:  Colors.white),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Driver : $driverName',style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),),
          Text('From : $from',style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),),
          Text('To : $to',style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),),
          Text('Price : $price',style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),),
        ],
      ),
    );
  }
}
