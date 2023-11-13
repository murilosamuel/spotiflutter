import 'package:dartz/dartz.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/authentication/domain/entities/token.entity.dart';

abstract class PerformAuthenticationUseCase {
  Future<Either<SpotiflutterException, Token>> call();
}