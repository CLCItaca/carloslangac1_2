import 'package:carloslangac1_2/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

class Validators{
  static String? validarNombre(String? _nombre){
    if(_nombre!.isEmpty || _nombre == null){
      return "Introduce tu nombre";
    }
    return null;
  }

  static String? validarPass(String? _pass){
    if(_pass!.isEmpty || _pass == null){
      return "Introduce una contraseña";
    }
    return null;
  }

  static String? validarPass2(String? _pass, String? _pass2){
    if(_pass2!.isEmpty || _pass2 == null || _pass2 != _pass){
      return "Las contraseñas no coinciden";
    }
    return null;
  }

  static String? validarEdad(int? _edad){
    if(_edad == null){
      return "Introduce una edad";
    }
    return null;
  }

  static String? validarNacimiento(String? _nacimiento){
    if(_nacimiento!.isEmpty || _nacimiento == null){
      return "Introduce lugar de nacimiento";
    }
    return null;
  }
}