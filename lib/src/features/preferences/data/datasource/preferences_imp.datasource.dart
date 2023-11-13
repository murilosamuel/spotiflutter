import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/core/constants/local_storage_keys.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/core/exceptions/unexpected.exception.dart';
import 'package:spotiflutter/src/core/storage/local.storage.dart';
import 'package:spotiflutter/src/core/utils/language.util.dart';
import 'package:spotiflutter/src/features/preferences/data/datasource/preferences.datasource.dart';
import 'package:spotiflutter/src/features/preferences/domain/entities/language.enum.dart';

@Injectable(as: PreferencesDataSource)
class PreferencesDataSourceImp implements PreferencesDataSource {
  final LocalStorage storage;

  PreferencesDataSourceImp(this.storage);

  @override
  Future<Either<SpotiflutterException, AppLanguage>> get() async {
    try {
      var languageStr = await storage.get(LocalStorageKeys.language);
      var language = LanguageUtil.parseToLanguage(languageStr);
      return Right(language);
    } catch (e) {
      return Left(UnexpectedException('Error on get preferences'));
    }
  }

  @override
  Future<Either<SpotiflutterException, bool>> save(
    AppLanguage language,
  ) async {
    try {
      await storage.put(LocalStorageKeys.language, language.abbreviation);
      return const Right(true);
    } catch (e) {
      return Left(UnexpectedException('Error on save preferences'));
    }
  }
}
