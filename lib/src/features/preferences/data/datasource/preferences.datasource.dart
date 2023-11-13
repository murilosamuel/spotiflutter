import 'package:dartz/dartz.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/preferences/domain/entities/language.enum.dart';

abstract class PreferencesDataSource {
  Future<Either<SpotiflutterException, bool>> save(AppLanguage language);
  Future<Either<SpotiflutterException, AppLanguage>> get();
}