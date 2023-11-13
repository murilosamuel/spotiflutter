import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/preferences/data/datasource/preferences.datasource.dart';
import 'package:spotiflutter/src/features/preferences/domain/entities/language.enum.dart';
import 'package:spotiflutter/src/features/preferences/domain/repository/preferences.repository.dart';

@Injectable(as: PreferencesRepository)
class PreferencesRepositoryImp implements PreferencesRepository {
  final PreferencesDataSource dataSource;

  PreferencesRepositoryImp(this.dataSource);

  @override
  Future<Either<SpotiflutterException, AppLanguage>> get() {
    return dataSource.get();
  }

  @override
  Future<Either<SpotiflutterException, bool>> save(AppLanguage language) {
    return dataSource.save(language);
  }
}
