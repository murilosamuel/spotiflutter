import 'package:dartz/dartz.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/authentication/domain/entities/token.entity.dart';

abstract class SpotifyAuthenticationFacade {
  Future<Either<SpotiflutterException, Token>> authenticate({
    required String clientId,
    required String clientSecret,
  });
}
