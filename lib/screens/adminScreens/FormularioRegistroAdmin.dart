import 'dart:io';
import 'package:carloslangac1_2/config/utils/Validators.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carloslangac1_2/config/utils/Camera.dart';
import 'package:carloslangac1_2/models/User.dart';
import 'package:carloslangac1_2/services/LogicaUsuarios.dart';

class FormularioRegistroAdmin extends StatefulWidget {
  const FormularioRegistroAdmin({super.key});

  @override
  State<FormularioRegistroAdmin> createState() => _FormularioRegistroAdminState();
}

class _FormularioRegistroAdminState extends State<FormularioRegistroAdmin> {
  final _formKey = GlobalKey<FormState>();

  int _sr = 1;
  String? photoPath;
  String? _nombre;
  String? _pass;
  int _edad = 0;
  String? _nacimiento;
  bool _terminos = false;
  bool _admin = false;

  void _pantallaPrimaria(){
    final isFormValid = _formKey.currentState!.validate();
    if(isFormValid && _terminos){
        User usuarioNuevo = User(nombre: _nombre.toString(), edad: _edad,
        passwrd: _pass.toString(), trata: _sr, nacimiento: _nacimiento.toString(), admin: _admin, active: true,
        imgPath: photoPath!);
        LogicaUsuarios.addUser(usuarioNuevo);
        Navigator.pop(context);
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
        child: Form(
          key: _formKey,
          child: Center(
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
                        TextFormField(  
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Nombre',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          _nombre = value;
                        },
                        validator: (value) => Validators.validarNombre(value),
                        
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
                            labelText: 'Contraseña',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => Validators.validarPass(value),
                          onChanged: (value) {
                            _pass = value;
                          },
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
                        validator: (value) => Validators.validarPass2(_pass, value),
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
                        kIsWeb ?
                        Container():
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
                      ]
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child:
                            photoPath != null 
                            ? Container(
                              child: kIsWeb ?
                                Image.network(photoPath!, height: 75, width: 75,)
                                : Image.file(File(photoPath!), height: 75, width: 75,)
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
                        validator: (value) => Validators.validarEdad(int.tryParse(value!)),
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
                        validator: (value) => Validators.validarNacimiento(value),
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
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Admin: '),
                    Checkbox(value: _admin, 
                      onChanged: (bool? value){
                        setState(() {
                          _admin = value!;
                        });
                      }
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
                            Text('Crear Usuario', style: TextStyle(color: Color.fromARGB(255, 22, 104, 255)))
                          ],
                        )
                      ),
                  ],
                ),
                
              ],
            )
          ),
        ),
      )
    );
  }
}