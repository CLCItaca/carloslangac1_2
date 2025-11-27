class Validators{
  static String? validarNombre(String? _nombre, String mensaje){
    if(_nombre!.isEmpty || _nombre == null){
      return mensaje;
    }
    return null;
  }

  static String? validarPass(String? _pass, String mensaje){
    if(_pass!.isEmpty || _pass == null){
      return mensaje;
    }
    return null;
  }

  static String? validarPass2(String? _pass, String? _pass2, String mensaje){
    if(_pass2!.isEmpty || _pass2 == null || _pass2 != _pass){
      return mensaje;
    }
    return null;
  }

  static String? validarEdad(int? _edad, String mensaje){
    if(_edad == null){
      return mensaje;
    }
    return null;
  }

  static String? validarNacimiento(String? _nacimiento, String mensaje){
    if(_nacimiento!.isEmpty || _nacimiento == null){
      return mensaje;
    }
    return null;
  }
}