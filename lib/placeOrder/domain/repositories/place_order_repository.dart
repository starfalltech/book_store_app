import 'package:dartz/dartz.dart';

import '../../../core/failure.dart';

abstract class PlaceOrderRepository {

  Future<Either<Failure, String>> postPayment(int amount);
}