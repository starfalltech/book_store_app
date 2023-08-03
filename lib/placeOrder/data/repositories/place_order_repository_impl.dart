import 'package:book_store_app/core/failure.dart';
import 'package:book_store_app/placeOrder/data/data_sources/place_order_remote_datasource.dart';
import 'package:book_store_app/placeOrder/domain/repositories/place_order_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../authentication/data/data_sources/authentication_remote_datasources.dart';
import '../../../core/exceptions.dart';
import '../../../core/network_info.dart';

class PlaceOrderRepositoryImpl extends PlaceOrderRepository{
  final NetworkInfo networkInfo;
  final PlaceOrderRemoteDataSource remoteDataSources;

  PlaceOrderRepositoryImpl(this.networkInfo, this.remoteDataSources);

  @override
  Future<Either<Failure, String>> postPayment(int amount) async{
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSources.postPayment(amount);
        return Right(user);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.msg));
      }
    } else {
      return Left(InternalFailure('You are Offline !'));
    }
  }

}