import 'dart:io';
import 'package:carloslangac1_2/config/resources/MyColors.dart';
import 'package:carloslangac1_2/config/utils/Validators.dart';
import 'package:carloslangac1_2/l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';
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

  int _sr = 1;
  String? photoPath;
  String? _nombre;
  String? _pass;
  int _edad = 0;
  String? _nacimiento;
  bool _terminos = false;

  void _pantallaPrimaria(){
    final isFormValid = _formKey.currentState!.validate();
    if(isFormValid && _terminos){
        User usuarioNuevo = User(nombre: _nombre.toString(), edad: _edad,
        passwrd: _pass.toString(), trata: _sr, nacimiento: _nacimiento.toString(), admin: false, active: true,
        imgPath: photoPath!);
        LogicaUsuarios.addUser(usuarioNuevo);
        Navigator.pop(context);
      }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.bannerColor,
        title: Text(l10n.registros, style: TextStyle(color: Colors.black))
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
                        Text(l10n.trata + ': ')
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
                                  Text(l10n.sr),
                                  Radio<int>(value: 0),
                                ],
                              ),
                              SizedBox(width: 10),
                              Row(
                                children: [
                                  Text(l10n.sra),
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
                          labelText: l10n.nombre,
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          _nombre = value;
                        },
                        validator: (value) => Validators.validarNombre(value,l10n.errorNombre),
                        
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
                            labelText: l10n.contrasena,
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => Validators.validarPass(value,l10n.errorContrasena),
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
                          labelText: l10n.contrasenaOtra,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => Validators.validarPass2(_pass, value, l10n.errorMismaContra),
                        onChanged: (value) {
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(l10n.anadirImagen +': '),
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
                          labelText: l10n.edad,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => Validators.validarEdad(int.tryParse(value!),l10n.errorMensaje),
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
                          labelText: l10n.nacimiento,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => Validators.validarNacimiento(value,l10n.errorNacimiento),
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
                    Text(l10n.terminos),
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
                        backgroundColor: MyColors.backgroundColor
                      ),
                      onPressed: _pantallaPrimaria,
                      child: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(l10n.crearUsuario, style: TextStyle(color: MyColors.buttonFontColor))
                          ],
                        )
                      ),
                  ],
                )
              ],
            )
          ),
        ),
      )
    );
  }
}