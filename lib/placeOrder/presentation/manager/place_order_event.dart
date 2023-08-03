part of 'place_order_bloc.dart';


abstract class PlaceOrderEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateparentInfo extends PlaceOrderEvent{

}

class PostPayment extends PlaceOrderEvent{
  final int ammout;

  PostPayment(this.ammout);
}