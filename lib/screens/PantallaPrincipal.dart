import 'package:carloslangac1_2/screens/FormularioRegistro.dart';
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
  String _errorMsg = "";
  final List<User> _lista = LogicaUsuarios.getListaUser();

  void _MiPerfil(){
    if(_errorMsg == "Por favor, introduce tu nombre"){
      print(_errorMsg);
      const snackBar = SnackBar(content: Text("Por favor, introduce tu nombre"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _errorMsg = "";
    }
    else if(_errorMsg == "Contraseña incorrecta"){
      const snackBar = SnackBar(content: Text("Por favor, introduce una contraseña"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _errorMsg = "";
    }
    else{
      for(int i = 0; i < _lista.length; i++){
        if(_lista[i].getNombre() == _nombre && _lista[i].getPasswrd() == _pass){
          Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => const FormularioRegistro()));
        }
      }
      const snackBar = SnackBar(content: Text("Usuario o contraseña incorrecto"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _Registro(){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const FormularioRegistro()));
  }

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(content: Text(""));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 167, 198, 255),
        title: Text('Pantalla Principal', style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250, 
              child: Image.asset('assets/images/logo.png')
            ),
            SizedBox(
              width: 350,
              child: 
              TextFormField(
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: "Nombre",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _errorMsg = "Por favor, introduce tu nombre";
                    return null;
                  }
                  return null;
                },
                onChanged: (value) {
                  _nombre = value;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              child: 
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: "Contraseña",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if ((value == null || value.isEmpty)) {
                    _errorMsg = "Contraseña incorrecta";
                  }
                  return null;
                },
                onChanged: (value) {
                  _nombre = value;
                },
              ),
            ),
      
            SizedBox(height: 40),
      
            OutlinedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250,40),
                backgroundColor: Color.fromARGB(255, 227, 237, 255)
              ),
              onPressed: _MiPerfil,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Iniciar Sesión', style: TextStyle(color: Color.fromARGB(255, 22, 104, 255)))
                ],
              )
            ),
      
            SizedBox(height: 10),
      
            OutlinedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250,40),
                backgroundColor: Color.fromARGB(255, 227, 237, 255)
              ),
              onPressed: _Registro,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Registrarse', style: TextStyle(color: Color.fromARGB(255, 22, 104, 255)))
                ],
              )
            ),
          ]
          
        
        ),
      )
    );
  }
}