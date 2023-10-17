part of 'ride_offers_cubit.dart';

@immutable
sealed class RideOffersState {}

final class RideOffersInitial extends RideOffersState {}

final class GetOffersSuccessState extends RideOffersState {}

final class AcceptOfferSuccessState extends RideOffersState {}

final class AcceptOfferErrorState extends RideOffersState {}

final class CancelRideSuccessState extends RideOffersState {}

final class CancelRideErrorState extends RideOffersState {}
