import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mab_drive/Features/History/Models/history_model.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

import '../../../Core/Database/Firebse/my_database.dart';
import '../../Profile Screen/ViewModel/profile_provider.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());
List<HistoryModel> history = [];
  showHistory({String? id})async{

    emit(HistoryLoading());
    try{
       MyDataBase.getHISTORY(id!);
       HistoryModel? historyModel;
       emit(HistorySuccess(historyModel));
    }catch(e){
      emit(HistoryFailed(e.toString()));
    }
  }
}
