import 'package:dartz/dartz.dart';
import 'package:spotiflutter/src/core/exceptions/spotiflutter.exception.dart';
import 'package:spotiflutter/src/features/preferences/domain/entities/language.enum.dart';

abstract class GetPreferencesUseCase {
  Future<Either<SpotiflutterException, AppLanguage>> call();
}
