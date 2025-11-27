import 'package:carloslangac1_2/config/resources/MyColors.dart';
import 'package:carloslangac1_2/config/utils/Music.dart';
import 'package:carloslangac1_2/config/utils/Validators.dart';
import 'package:carloslangac1_2/controllers/user_controller.dart';
import 'package:carloslangac1_2/l10n/app_localizations.dart';
import 'package:carloslangac1_2/screens/adminScreens/PantallaSecundariaAdmin.dart';
import 'package:carloslangac1_2/screens/userScreens/FormularioRegistro.dart';
import 'package:carloslangac1_2/screens/userScreens/PantallaSecundariaUser.dart';
import 'package:flutter/material.dart';
import 'package:carloslangac1_2/services/LogicaUsuarios.dart';
import 'package:carloslangac1_2/models/User.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  String? _nombre;
  String? _pass;
  bool _errorMsg = false;
  bool _LogIn = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  void _reproducir() async{
    await Music.playMusic();
  }
  void _MiPerfil(String usuarioBloqueado, String contrasenaError) {
    final _isFormValid = _formKey.currentState!.validate();
    _LogIn = false;
    bool blocked = false;
    if(_isFormValid){
      for(User i in LogicaUsuarios.getListaUser()){
        if(_nombre! == i.getNombre() && _pass! == i.getPasswrd() && i.getActive()){
          _LogIn = true;
          blocked = false;
          User _usuario = i;
          if(i.getAdmin()){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PantallaSecundariaAdmin(usuario: _usuario)
            )).then((_) => _formKey.currentState?.reset());
          }
          else{
            _reproducir();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PantallaSecundariaUser(usuario: _usuario)
            )).then((_) => _formKey.currentState?.reset()); 
          }  
        }
        if(_nombre! == i.getNombre() && _pass! == i.getPasswrd() && i.getActive() == false){
          blocked = true;
        }
      }
      _errorMsg = true;
    }
    if(_errorMsg && !_LogIn){
      var snackBar = SnackBar(content: Text(''));
      if(blocked){
        snackBar = SnackBar(content: Text(usuarioBloqueado));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      else{
        snackBar = SnackBar(content: Text(contrasenaError));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      _errorMsg = false;
    }
      
  }

  void _Registro() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => FormularioRegistro()
      )
    ).then((_) => _formKey.currentState?.reset());
  }
                      
  void _recuperarPass(String recuperar, String nombreUsuario, String cancelar, String aceptar){
    String? _nombreUser;
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text(recuperar), 
      
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: nombreUsuario,
                border: OutlineInputBorder(),
              ),
              onChanged:(value) => _nombreUser = value,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () => Navigator.pop(context), 
                  child: Text(cancelar)),
                OutlinedButton(onPressed: () {
                  for(User i in LogicaUsuarios.getListaUser()){
                    if(_nombreUser == i.getNombre()){
                      showDialog(context: context, builder: (context) => AlertDialog(
                        title: Text(i.getPasswrd()))
                      );
                    }
                  }
                },
                  child: Text(aceptar))
              ],
            )
          ],
        )
          
      ) 
    ));
  }
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 167, 198, 255),
        title: Text(
          l10n.pantallaPrincipal,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: l10n.nombre,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _nombre = value;
                    },
                    onFieldSubmitted: (value) {
                      controller.clear();
                    },
                    validator: (value) => Validators.validarNombre(value,l10n.errorNombre),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: l10n.contrasena,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _pass = value;
                    },
                    onFieldSubmitted: (value) {
                      controller.clear();
                    },
                    validator: (value) => Validators.validarPass(value,l10n.errorContrasena),
                  ),
                ),

                SizedBox(height: 40),

                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 40),
                    backgroundColor: MyColors.backgroundColor,
                  ),
                  onPressed: (){
                    _MiPerfil(l10n.usuarioBloqueado, l10n.contrasenaError);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.iniciarSesion,
                        style: TextStyle(
                          color: MyColors.buttonFontColor,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 40),
                    backgroundColor: MyColors.backgroundColor,
                  ),
                  onPressed: _Registro,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.registrarse,
                        style: TextStyle(
                          color: MyColors.buttonFontColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(onPressed: () async {
                  final userCredential = await UserController.loginGoogle();
                   if (userCredential != null){
                    User usuarioGoogle = new User(
                      nombre: UserController.nombre!,
                      edad: 18,
                      passwrd: '1234',
                      trata: 1,
                      nacimiento: 'España',
                      active: true,
                      admin: false,
                      imgPath: UserController.foto!
                    );
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => PantallaSecundariaUser(usuario: usuarioGoogle))
                      );
                  }
                }, 
                  child: Text(l10n.inicioGoogle)
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(230,40),
                    backgroundColor: MyColors.backgroundColor,
                  ),
                  onPressed: (){
                    _recuperarPass(l10n.recuperar, l10n.nombreUsuario, l10n.cancelar, l10n.aceptar);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.olvido,
                        style: TextStyle(
                          color: MyColors.buttonFontColor
                        )
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
