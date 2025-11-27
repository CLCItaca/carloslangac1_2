import 'dart:ui';

enum Idioma {english, spanish}

extension IdiomaExtension on Idioma {
  String get locale {
    switch (this){
      case Idioma.english:
        return 'en';
      case Idioma.spanish:
        return 'es';
      default: 
        return 'es';
    }
  }

  String get name {
    switch(this){
      case Idioma.english:
        return 'English';
      case Idioma.spanish:
        return 'Español';
      default:
        return 'Español';
    }
  }

  String get flag {
    switch(this){
      case Idioma.english:
        return 'US';
      case Idioma.spanish:
        return 'ES';
      default:
        return 'ES';
    }
  }

  Locale get localeValue {
    switch(this){
      case Idioma.english:
        return const Locale('en', "US");
      case Idioma.spanish:
        return const Locale('es', "ES");
      default:
        return const Locale('es', "US");
    }
  }
}