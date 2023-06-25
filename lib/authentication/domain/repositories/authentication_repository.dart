import 'package:dartz/dartz.dart';

import '../../../core/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, bool>> login(String email, String password);

  Future<Either<Failure, bool>> register(
    String email,
    String password,
    String cell,
    String name,
  );
}
