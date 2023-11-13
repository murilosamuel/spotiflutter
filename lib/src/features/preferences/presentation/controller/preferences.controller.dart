import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:spotiflutter/src/features/preferences/domain/entities/language.enum.dart';
import 'package:spotiflutter/src/features/preferences/domain/usecases/get_preferences.usecase.dart';
import 'package:spotiflutter/src/features/preferences/domain/usecases/save_preferences.usecase.dart';

@Injectable()
class PreferencesController {
  final SavePreferencesUseCase savePreferencesUseCase;
  final GetPreferencesUseCase getPreferencesUseCase;

  PreferencesController(
    this.savePreferencesUseCase,
    this.getPreferencesUseCase,
  );

  ValueNotifier<AppLanguage?> language = ValueNotifier(null);

  void setLanguage(AppLanguage value) => language.value = value;

  Future<void> loadPreferences() async {
    var result = await getPreferencesUseCase();
    if (result.isRight()) {
      var value = (result as Right).value;
      setLanguage(value);
    }
  }

  Future<void> savePreferences() async{
    if (language.value != null) {
      await savePreferencesUseCase.call(language.value!);
    }
  }
}
