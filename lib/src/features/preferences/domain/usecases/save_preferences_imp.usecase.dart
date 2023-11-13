import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/preferences/domain/entities/language.enum.dart';
import 'package:spotiflutter/src/features/preferences/domain/repository/preferences.repository.dart';
import 'package:spotiflutter/src/features/preferences/domain/usecases/save_preferences.usecase.dart';

@Injectable(as: SavePreferencesUseCase)
class SavePreferencesUseCaseImp implements SavePreferencesUseCase {
  final PreferencesRepository repository;

  SavePreferencesUseCaseImp(this.repository);

  @override
  Future<Either<SpotiflutterException, bool>> call(AppLanguage language) {
    return repository.save(language);
  }
}
