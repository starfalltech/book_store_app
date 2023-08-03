import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store_app/placeOrder/domain/repositories/place_order_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../authentication/presentation/manager/auth_bloc.dart';
import '../../../core/failure.dart';

part 'place_order_event.dart';
part 'place_order_state.dart';

class PlaceOrderBloc extends Bloc<PlaceOrderEvent, PlaceOrderState> {
  final PlaceOrderRepository repository;
  PlaceOrderBloc(this.repository) : super(PlaceOrderInitial()) {
    on<PostPayment>(postPaymentMapToState);
  }

  FutureOr<void> postPaymentMapToState(PostPayment event, Emitter<PlaceOrderState> emit) async{
    emit(LoadingPlaceOrder());
    final postRegister = await repository.postPayment(event.ammout);
    postRegister.fold((l) {
      if (l is ServerFailure) {
        emit(FailurePlaceOrder(l.msg));
      }
    }, (r) => emit(SuccesPlaceOrder(r)));
  }
}
