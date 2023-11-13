import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/authentication/domain/entities/token.entity.dart';
import 'package:spotiflutter/src/features/authentication/domain/facade/authentication.facade.dart';
import 'package:spotiflutter/src/features/authentication/domain/usecases/perform_authentication.usecase.dart';

@Injectable(as: PerformAuthenticationUseCase)
class PerformAuthenticationUseCaseImp implements PerformAuthenticationUseCase {
  final SpotifyAuthenticationFacade authenticationFacade;

  PerformAuthenticationUseCaseImp(this.authenticationFacade);

  @override
  Future<Either<SpotiflutterException, Token>> call() {
    String client = dotenv.env['SPOTIFY_CLIENT_ID'] ?? '';
    String secret = dotenv.env['SPOTIFY_CLIENT_SECRET'] ?? '';
    return authenticationFacade.authenticate(
      clientId: client,
      clientSecret: secret,
    );
  }
}
