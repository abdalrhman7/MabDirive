import 'package:flutter/material.dart';

import '../Component/history_item.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});
static const String routeName = "history";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        title: const Text('History',style: TextStyle(
            color: Colors.white,
            fontSize: 25
        ),),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10,),
          itemCount: 10,
          itemBuilder: (context, index) {
            return HistoryItem(
              driverName: 'Messi',
              from: 'Cairo',
              to: 'Alex',
              price: '200',
            );
          },),
    );
  }
}
