part of 'ride_offers_cubit.dart';

@immutable
sealed class RideOffersState {}

final class RideOffersInitial extends RideOffersState {}

final class GetOffersSuccessState extends RideOffersState {}
