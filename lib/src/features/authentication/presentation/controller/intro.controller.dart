import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/constants/local_storage_keys.dart';
import 'package:spotiflutter/src/core/storage/local.storage.dart';
import 'package:spotiflutter/src/features/authentication/domain/entities/token.entity.dart';
import 'package:spotiflutter/src/features/authentication/domain/usecases/perform_authentication.usecase.dart';
import 'package:spotiflutter/src/features/preferences/domain/entities/language.enum.dart';
import 'package:spotiflutter/src/features/preferences/domain/usecases/get_preferences.usecase.dart';

@Injectable()
class IntroController {
  final PerformAuthenticationUseCase performAuthenticationUseCase;
  final LocalStorage localStorage;
  final GetPreferencesUseCase getPreferencesUseCase;

  IntroController(
    this.performAuthenticationUseCase,
    this.localStorage,
    this.getPreferencesUseCase,
  );

  Future<bool> authenticate() async {
    var result = await performAuthenticationUseCase.call();
    if (result.isRight()) {
      Token token = (result as Right).value;
      localStorage.put(
        LocalStorageKeys.spotifyAccessToken,
        token.accessToken ?? '',
      );
      return true;
    }
    return false;
  }

  Future<AppLanguage> loadPreferences() async {
    var result = await getPreferencesUseCase();
    if (result.isRight()) {
      return (result as Right).value;
    }
    return AppLanguage.english;
  }
}
