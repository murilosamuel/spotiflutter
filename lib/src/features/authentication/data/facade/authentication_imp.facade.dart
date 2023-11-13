import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/authentication/domain/entities/token.entity.dart';
import 'package:spotiflutter/src/features/authentication/domain/facade/authentication.facade.dart';
import 'package:spotiflutter_auth/spotiflutter_auth.dart';

@Injectable(as: SpotifyAuthenticationFacade)
class SpotifyAuthenticationFacadeImp implements SpotifyAuthenticationFacade {
  @override
  Future<Either<SpotiflutterException, Token>> authenticate({
    required String clientId,
    required String clientSecret,
  }) async {
    SpotiflutterAuth auth = SpotiflutterAuth();
    var response = await auth.authenticate(
      clientId: clientId,
      clientSecret: clientSecret,
      customUriScheme: 'com.spotflutter.dev',
      redirectUri: 'com.spotflutter.dev://callback',
    );

    return Right(Token(
      expiresIn: response.expiresIn,
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    ));
  }
}
