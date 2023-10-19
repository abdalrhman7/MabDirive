import 'package:flutter/material.dart';
import 'package:mab_drive/Features/History/Models/history_model.dart';

class HistoryItem extends StatelessWidget {
   HistoryItem({super.key,

     required this.historyModel
  });

HistoryModel historyModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color:  Colors.white),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Driver : ${historyModel.driverName}',style: const TextStyle(
              color: Colors.white,
              fontSize: 20
          ),),

          Text('To : ${historyModel.destination}',style: const TextStyle(
              color: Colors.white,
              fontSize: 20
          ),),
          Text('Price : ${historyModel.price}',style: const TextStyle(
              color: Colors.white,
              fontSize: 20
          ),),
        ],
      ),
    );
  }
}
