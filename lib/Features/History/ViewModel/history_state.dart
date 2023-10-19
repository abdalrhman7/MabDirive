part of 'history_cubit.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}
class HistorySuccess extends HistoryState {
  HistoryModel? historyModel;
  HistorySuccess(this.historyModel);
}
class HistoryFailed extends HistoryState{
  String? message;
  HistoryFailed(this.message);
}
class HistoryLoading extends HistoryState{}
