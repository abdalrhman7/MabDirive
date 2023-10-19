import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mab_drive/Features/History/Models/history_model.dart';
import 'package:mab_drive/Features/History/ViewModel/history_cubit.dart';
import 'package:provider/provider.dart';

import '../../../../Core/Database/Firebse/my_database.dart';
import '../../../Profile Screen/ViewModel/profile_provider.dart';
import '../Component/history_item.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  static const String routeName = "history";

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text('History', style: TextStyle(
            color: Colors.white,
            fontSize: 25
        ),),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<QuerySnapshot<HistoryModel>>(
                future: MyDataBase.getHISTORY(
                    authProvider.currentUser?.id??""
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  // finished
                  var historyList =
                  snapshot.data?.docs.map((doc) => doc.data()).toList();
                  if (historyList?.isEmpty == true) {
                    return const Center(
                      child: Text("You don't have any rides yet",
                        style: TextStyle(
                            color: Color(0xffEDEDED),
                            fontSize: 20
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemBuilder: (_, index) {
                      return HistoryItem(historyModel:historyList![index]);
                    },
                    itemCount: historyList?.length ?? 0,
                  );
                },
              )),
        ],
      )





      // BlocProvider(
      //   create: (context) =>
      //   HistoryCubit()
      //     ..showHistory(id: authProvider.currentUser?.id ?? ''),
      //   child: BlocBuilder<HistoryCubit, HistoryState>(
      //     builder: (context, state) {
      //       if(state is HistoryLoading){
      //         return const Center(child: CircularProgressIndicator());
      //       }
      //       else if(state is HistorySuccess){
      //
      //         var historyList =
      //         state.data?.docs.map((doc) => doc.data()).toList();
      //         return ListView.separated(
      //           separatorBuilder: (context, index) => const SizedBox(height: 10,),
      //           itemCount: ,
      //           itemBuilder: (context, index) {
      //             return HistoryItem(
      //               driverName: state.historyModel?.driverName??"",
      //               to:  state.historyModel?.destination??"",
      //               price:  state.historyModel?.price??"",
      //             );
      //           },);
      //       }
      //
      //     },
      //   ),
      // ),
    );
  }
}
