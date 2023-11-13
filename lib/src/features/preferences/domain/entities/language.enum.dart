import 'package:flutter/material.dart';

enum AppLanguage {
  english,
  spanish,
  portuguese,
}

extension EAppLanguages on AppLanguage {
  String get abbreviation {
    switch (this) {
      case AppLanguage.english:
        return 'en';
      case AppLanguage.spanish:
        return 'es';
      case AppLanguage.portuguese:
        return 'pt';
    }
  }

  String get market {
    switch (this) {
      case AppLanguage.english:
        return 'us';
      case AppLanguage.spanish:
        return 'es';
      case AppLanguage.portuguese:
        return 'br';
    }
  }

  Locale get locale => Locale(abbreviation);
}
