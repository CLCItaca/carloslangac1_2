import 'package:carloslangac1_2/config/utils/Validators.dart';
import 'package:carloslangac1_2/controllers/user_controller.dart';
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

  void _MiPerfil() {
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
      if(blocked){
        const snackBar = SnackBar(content: Text('Este usuario esta bloqueado'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      else{
        const snackBar = SnackBar(content: Text('Usuario o contraseña incorrectos'));
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
                      
  void _recuperarPass(){
    String? _nombreUser;
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('Recuperar Contraseña'), 
      
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: "Nombre de Usuario",
                border: OutlineInputBorder(),
              ),
              onChanged:(value) => _nombreUser = value,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () => Navigator.pop(context), 
                  child: Text('Cancelar')),
                OutlinedButton(onPressed: () {
                  for(User i in LogicaUsuarios.getListaUser()){
                    if(_nombreUser == i.getNombre()){
                      showDialog(context: context, builder: (context) => AlertDialog(
                        title: Text(i.getPasswrd()))
                      );
                    }
                  }
                },
                  child: Text('Aceptar'))
              ],
            )
          ],
        )
          
      ) 
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 167, 198, 255),
        title: Text(
          'Pantalla Principal',
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
                      labelText: "Nombre",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _nombre = value;
                    },
                    onFieldSubmitted: (value) {
                      controller.clear();
                    },
                    validator: (value) => Validators.validarNombre(value),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Contraseña",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _pass = value;
                    },
                    onFieldSubmitted: (value) {
                      controller.clear();
                    },
                    validator: (value) => Validators.validarPass(value),
                  ),
                ),

                SizedBox(height: 40),

                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 40),
                    backgroundColor: Color.fromARGB(255, 227, 237, 255),
                  ),
                  onPressed: _MiPerfil,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          color: Color.fromARGB(255, 22, 104, 255),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 40),
                    backgroundColor: Color.fromARGB(255, 227, 237, 255),
                  ),
                  onPressed: _Registro,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Registrarse',
                        style: TextStyle(
                          color: Color.fromARGB(255, 22, 104, 255),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(onPressed: () async {
                  final userCredential = await UserController.loginGoogle();
                  // if (userCredential != null){
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => PantallaSecundaria(usuario:))
                  //     );
                  // }
                }, 
                  child: Text('Acceder con Google')
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(230,40),
                    backgroundColor: Color.fromARGB(255, 227, 237, 255),
                  ),
                  onPressed: _recuperarPass,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 22, 104, 255)
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
