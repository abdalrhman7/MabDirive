import 'package:bloc/bloc.dart';
import 'package:mab_drive/Features/History/Models/history_model.dart';

import '../../../Core/Database/Firebse/my_database.dart';

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
