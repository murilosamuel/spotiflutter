import 'package:spotiflutter/src/features/preferences/domain/entities/language.enum.dart';

class LanguageUtil{
  LanguageUtil._();
  static AppLanguage parseToLanguage(String? value){
    var appLanguage = AppLanguage.values.firstWhere(
          (element) => element.abbreviation == value,
      orElse: () => AppLanguage.english,
    );
    return appLanguage;
  }
}