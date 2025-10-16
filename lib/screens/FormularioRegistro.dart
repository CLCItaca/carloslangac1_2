import 'dart:io';

import 'package:carloslangac1_2/screens/PantallaPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:carloslangac1_2/config/utils/Camera.dart';
import 'package:carloslangac1_2/models/User.dart';
import 'package:carloslangac1_2/services/LogicaUsuarios.dart';

class FormularioRegistro extends StatefulWidget {
  const FormularioRegistro({super.key});

  @override
  State<FormularioRegistro> createState() => _FormularioRegistroState();
}

class _FormularioRegistroState extends State<FormularioRegistro> {
  final _formKey = GlobalKey<FormState>();
  int _sr = 2;
  String? photoPath;
  String? _nombre;
  String? _passwrd;
  int _edad = 0;
  String? _nacimiento;
  bool _terminos = false;
  String _errorMsg = "";

  void _pantallaPrimaria(){
    final isFormValid = _formKey.currentState!.validate();
    const snackBar = SnackBar(content: Text(''));

    if(isFormValid){
      if(_errorMsg != ""){
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print(_errorMsg);
        _errorMsg == "";
      }
      
    }
    else{
        User usuarioNuevo = User(nombre: _nombre.toString(), edad: _edad,
        passwrd: _passwrd.toString(), trata: _sr, nacimiento: _nacimiento.toString());
        LogicaUsuarios.addUser(usuarioNuevo);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PantallaPrincipal())
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 167, 198, 255),
        title: Text('Registros', style: TextStyle(color: Colors.black))
      ),
      body: SingleChildScrollView(
        child: Center(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Tratamiento: ')
                    ]
                  ),
                  SizedBox(width: 15),
                  FormField<bool>(
                     builder: (formFieldState){
                        return RadioGroup<int>(
                        groupValue: _sr,
                        onChanged: (int? value){
                          setState(() {
                            _sr = value!;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Row(
                              children: [
                                Text('Sr.'),
                                Radio<int>(value: 0),
                              ],
                            ),
                            SizedBox(width: 10),
                            Row(
                              children: [
                                Text('Sra.'),
                                Radio<int>(value: 2),
                              ],
                            )
                            
                          ]
                        )
                      );
                    },
                  )
                ]
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: 
                      Form(
                        child:
                          TextFormField(  
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Nombre',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value){
                            if(value == null){
                              _errorMsg ="Introduczca un nombre";
                            }
                          },
                          onChanged: (value) {
                            _nombre = value;
                          },
                          ),
                      )
                      
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: 
                      Form(
                        child:
                        TextFormField(                         
                          obscureText: true,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Contraseña',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if(value == null && _errorMsg != ""){
                              _errorMsg = "Introduce una contraseña";
                            }
                          },
                          onChanged: (value) {
                            _passwrd = value;
                          },
                        ),
                      )
                      
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: 
                      TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Introduce tu contraseña otra vez',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if((value != _passwrd || value == null) && _errorMsg != ""){
                          _errorMsg == "Las contraseñas no coinciden";
                        }
                      },
                      onChanged: (value) {
                      },
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Añadir imagen:'),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      FloatingActionButton(
                        child: const Icon(Icons.image),
                        onPressed: () async {
                          final path = await CameraGalleryService().selectPhoto();
                          if (path == null) return;
                          setState((){
                            photoPath = path;
                          });
                        }
                      )
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      FloatingActionButton(
                        child: const Icon(Icons.camera_alt),
                        onPressed: () async{
                          final path = await CameraGalleryService().takePhoto();
                          if (path == null) return;
                          setState((){
                            photoPath = path;
                          });
                        }
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 150,
                        child:
                          photoPath != null 
                          ? Image(
                            image: FileImage(File(photoPath!)),
                            fit: BoxFit.fill,
                          )
                          : Container()
                          )
                    ]
                  ),
                ], 
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: 
                      TextFormField(
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Edad',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if(_errorMsg != "" && value == null){
                          _errorMsg = "Introduce una edad";
                        }
                      },
                      onChanged: (value) {
                        _edad = int.tryParse(value)!;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: 
                      TextFormField(
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Lugar de nacimiento',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if(_errorMsg != "" && value == null){
                          _errorMsg = "Introduce un lugar de nacimiento";
                        }
                      },
                      onChanged: (value) {
                        _nacimiento = value;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Aceptas los términos y condiciones"),
                  Checkbox(
                    value: _terminos, 
                    onChanged: (bool? value) { 
                      setState(() {
                        _terminos = value!;
                      });  
                    },
                    
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(250,40),
                      backgroundColor: Color.fromARGB(255, 227, 237, 255)
                    ),
                    onPressed: _pantallaPrimaria,
                    child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Iniciar Sesión', style: TextStyle(color: Color.fromARGB(255, 22, 104, 255)))
                        ],
                      )
                    ),
                ],
              )
            ],
          )
        ),
      )
    );
  }
}