import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/preferences/domain/entities/language.enum.dart';
import 'package:spotiflutter/src/features/preferences/domain/repository/preferences.repository.dart';
import 'package:spotiflutter/src/features/preferences/domain/usecases/get_preferences.usecase.dart';

@Injectable(as: GetPreferencesUseCase)
class GetPreferencesUseCaseImp implements GetPreferencesUseCase {
  final PreferencesRepository repository;

  GetPreferencesUseCaseImp(this.repository);

  @override
  Future<Either<SpotiflutterException, AppLanguage>> call() {
    return repository.get();
  }
}
