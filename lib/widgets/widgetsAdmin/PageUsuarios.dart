import 'dart:io';

import 'package:carloslangac1_2/config/resources/MyColors.dart';
import 'package:carloslangac1_2/l10n/app_localizations.dart';
import 'package:carloslangac1_2/models/User.dart';
import 'package:carloslangac1_2/screens/adminScreens/EditarUsuarioAdmin.dart';
import 'package:carloslangac1_2/screens/adminScreens/FormularioRegistroAdmin.dart';
import 'package:carloslangac1_2/services/LogicaUsuarios.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageUsuarios extends StatefulWidget {
  final User usuario;
  const PageUsuarios({super.key, required this.usuario});

  @override
  State<PageUsuarios> createState() => _PageUsuariosState();
}

class _PageUsuariosState extends State<PageUsuarios> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    List<User> _listaUsuarios = LogicaUsuarios.getListaUser();
    _listaUsuarios.removeAt(0);
    
     void addUser(){
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => FormularioRegistroAdmin()
      ));
    }
    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.topCenter,
      child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _listaUsuarios.length,
              itemBuilder: (context, index) {

                void editUsuario(){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => EditarUsuarioAdmin(usuario: _listaUsuarios.elementAt(index))));
                }

                void eraseUsuario(User usuario){
                  String? intentoBorrar;
                  showDialog(context: context, builder: (context) => AlertDialog(
                    title: Text(l10n.borrar + ' ' + l10n.usuario),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(l10n.asegurarUsuario),
                          SizedBox(height: 20),
                          Text(l10n.asegurarContrasena, style: TextStyle(fontStyle: FontStyle.italic),),
                          SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: l10n.contrasena + ' ' + l10n.admin, 
                              border: OutlineInputBorder()
                            ),
                            onChanged: (value){
                              intentoBorrar = value;
                            }
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(onPressed: () => Navigator.pop(context),
                              child: Text(l10n.cancelar),
                              ),
                              OutlinedButton(onPressed: (){
                                if(intentoBorrar == usuario.getPasswrd()){
                                  LogicaUsuarios.getListaUser().removeAt(index);
                                }
                                Navigator.pop(context);
                              }, 
                                child: Text(l10n.aceptar)
                              )
                            ],
                          )
                        ]
                      )
                    )
                  ));
                }
                return Card(
                  color: MyColors.orderBoxColor,
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.all(10),
                            child: _listaUsuarios.elementAt(index).getImgPath() != null ?
                              _listaUsuarios.elementAt(index).getImgPath().startsWith("assets") ?
                              Image.asset(_listaUsuarios.elementAt(index).getImgPath()) :
                              kIsWeb ?
                                Image.network(_listaUsuarios.elementAt(index).getImgPath()) :
                                Image.file(File(_listaUsuarios.elementAt(index).getImgPath()))
                            : const Icon(Icons.person),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(left: 10)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _listaUsuarios.elementAt(index).getNombre(),
                            style: TextStyle(fontSize: 25)
                            )
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(left: 150)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            onPressed: editUsuario,
                            child: Icon(Icons.create, color: Colors.blue),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(left: 50)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              LogicaUsuarios.getListaUser().elementAt(index).changeActive();
                              setState(() {});
                            },
                            child: _listaUsuarios.elementAt(index).getActive() ?
                              Icon(Icons.check, color: Colors.green) :
                              Icon(Icons.close, color: Colors.red)
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsetsGeometry.only(left: 50)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              eraseUsuario(widget.usuario);
                              setState(() {});
                            },
                            child: Icon(Icons.delete, color: Colors.red)
                          )
                        ],
                      ),
                    ],
                  )
                );
              }
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: addUser,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(250,40),
                  backgroundColor: MyColors.backgroundColor,
                ), 
                child: 
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_2, color :MyColors.buttonFontColor),
                    Text(
                      l10n.anadirUsuario,
                      style: TextStyle(
                        color: MyColors.buttonFontColor
                      )
                    )
                  ],
                  )
              )
            ],
          )
        ]
      )
    );
  }
}