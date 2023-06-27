import 'package:book_store_app/authentication/data/data_sources/authentication_remote_datasources.dart';
import 'package:book_store_app/authentication/domain/repositories/authentication_repository.dart';
import 'package:book_store_app/core/failure.dart';
import 'package:book_store_app/core/local_auth_storage.dart';
import 'package:dartz/dartz.dart';

import '../../../core/exceptions.dart';
import '../../../core/network_info.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final NetworkInfo networkInfo;
  final AuthenticationRemoteDataSources remoteDataSources;

  AuthenticationRepositoryImpl(this.remoteDataSources, this.networkInfo);

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSources.login(email, password);
        await LocalAuthStorage().write("token", user);
        return const Right(true);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.msg));
      }
    } else {
      return Left(InternalFailure('You are Offline !'));
    }
  }

  @override
  Future<Either<Failure, bool>> register(
      String email, String password, String cell, String name) async {
    if (await networkInfo.isConnected) {
      try {
        final user =
            await remoteDataSources.register(name, email, password, cell);
        await LocalAuthStorage().write("token", user);
        return const Right(true);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.msg));
      }
    } else {
      return Left(InternalFailure('You are Offline !'));
    }
  }

  @override
  Future<Either<Failure, bool>> verify(String email, String code) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSources.verify(email, code);
        return const Right(true);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.msg));
      }
    } else {
      return Left(InternalFailure('You are Offline !'));
    }
  }

  @override
  Future<Either<Failure, bool>> signWithGoogle() async{
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSources.signWithGoogle();
        return const Right(true);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.msg));
      }
    } else {
      return Left(InternalFailure('You are Offline !'));
    }
  }
}
