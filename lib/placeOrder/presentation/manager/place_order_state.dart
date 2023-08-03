part of 'place_order_bloc.dart';

@immutable
abstract class PlaceOrderState {}

class PlaceOrderInitial extends PlaceOrderState {}
class SuccesPlaceOrder extends PlaceOrderState{
  final String url;

  SuccesPlaceOrder(this.url);
}
class LoadingPlaceOrder extends PlaceOrderState{}
class FailurePlaceOrder extends PlaceOrderState{
  final String msg;

  FailurePlaceOrder(this.msg);
}