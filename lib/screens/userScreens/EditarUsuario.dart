import 'package:carloslangac1_2/config/resources/MyColors.dart';
import 'package:carloslangac1_2/l10n/app_localizations.dart';
import 'package:carloslangac1_2/models/User.dart';
import 'package:flutter/material.dart';

class EditarUsuario extends StatefulWidget {
  final User usuario;
  const EditarUsuario({super.key, required this.usuario});

  @override
  State<EditarUsuario> createState() => _EditarUsuarioState();
}

class _EditarUsuarioState extends State<EditarUsuario> {
  
  void _ventanaEmergente(int index){
    final l10n = AppLocalizations.of(context)!;
    switch(index){
      case 0:
        String? _cambioNombre;
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(l10n.cambiar + ' ' + l10n.nombre),
          content:SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: l10n.nuevo + ' ' + l10n.nombre,
                    border: OutlineInputBorder()
                  ),
                  onChanged: (value){
                    if(value != ''){
                      _cambioNombre = value;
                    }
                    else{
                      _cambioNombre = widget.usuario.getNombre();
                    }
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () => Navigator.pop(context),
                    child: Text(l10n.cancelar),
                    ),
                    OutlinedButton(onPressed: (){
                      widget.usuario.setNombre(_cambioNombre!);
                      print(widget.usuario.getNombre());
                      Navigator.pop(context);
                    }, 
                      child: Text(l10n.aceptar)
                    )
                  ],
                )
              ],
            )
          )
        ));
        
        case 1:
          String? _cambioEdad;
          showDialog(context: context, builder: (context) => AlertDialog(
            title: Text(l10n.cambiar + ' ' + l10n.edad),
            content:SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: l10n.nuevo + ' ' + l10n.edad,
                      border: OutlineInputBorder()
                    ),
                    onChanged: (value){
                      if(value != ''){
                        _cambioEdad = value;
                      }
                      else{
                        _cambioEdad = widget.usuario.getEdad().toString();
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () => Navigator.pop(context),
                      child: Text(l10n.cancelar),
                      ),
                      OutlinedButton(onPressed: (){
                        widget.usuario.setEdad(int.parse(_cambioEdad!));
                        Navigator.pop(context);
                      }, 
                        child: Text(l10n.aceptar)
                      )
                    ],
                  )
                ],
              )
            )
          )
          );
        case 2:
          String? _cambioPass;
          showDialog(context: context, builder: (context) => AlertDialog(
            title: Text(l10n.cambiar + ' ' + l10n.contrasena),
            content:SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: l10n.nuevo + " " + l10n.contrasena,
                      border: OutlineInputBorder()
                    ),
                    onChanged: (value){
                      if(value != ''){
                        _cambioPass = value;
                      }
                      else{
                        _cambioPass = widget.usuario.getPasswrd();
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () => Navigator.pop(context),
                      child: Text(l10n.cancelar),
                      ),
                      OutlinedButton(onPressed: (){
                        widget.usuario.setPasswrd(_cambioPass!);
                        Navigator.pop(context);
                      }, 
                        child: Text(l10n.aceptar)
                      )
                    ],
                  )
                ],
              )
            )
          )
          );
          case 3:
            int? _cambioTrata;
            showDialog(context: context, builder: (context) => AlertDialog(
              title: Text(l10n.cambiar + ' '  + l10n.trata),
              content:SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    RadioGroup<int>(
                      groupValue: _cambioTrata,
                      onChanged: (int? value){
                        setState(() {
                          _cambioTrata = value!;
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
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () => Navigator.pop(context),
                        child: Text(l10n.cancelar),
                        ),
                        OutlinedButton(onPressed: (){
                          widget.usuario.setTrata(_cambioTrata!);
                          Navigator.pop(context);
                        }, 
                          child: Text(l10n.aceptar)
                        )
                      ],
                    )
                  ],
                )
              )
            )
            );
            case 4:
              String? _cambioNacimiento;
            showDialog(context: context, builder: (context) => AlertDialog(
              title: Text(l10n.cambiar + ' ' + l10n.nacimiento),
              content:SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: l10n.nuevo + ' ' + l10n.nacimiento,
                        border: OutlineInputBorder()
                      ),
                      onChanged: (value){
                        if(value != ''){
                          _cambioNacimiento = value;
                        }
                        else{
                          _cambioNacimiento = widget.usuario.getNacimiento();
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () => Navigator.pop(context),
                        child: Text(l10n.cancelar),
                        ),
                        OutlinedButton(onPressed: (){
                          widget.usuario.setPasswrd(_cambioNacimiento!);
                          Navigator.pop(context);
                        }, 
                          child: Text(l10n.aceptar)
                        )
                      ],
                    )
                  ],
                )
              )
            )
            );

    }
  }
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.bannerColor,
        title: Text(l10n.editarUsuario)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: (){
                  _ventanaEmergente(0);
                },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 40),
                    backgroundColor: MyColors.backgroundColor,
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(l10n.cambiar + ' ' + l10n.nombre)
                      ],
                    ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: (){
                  _ventanaEmergente(1);
                }, 
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 40),
                    backgroundColor: MyColors.backgroundColor,
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(l10n.cambiar + ' ' + l10n.edad)
                      ],
                    ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: (){
                  _ventanaEmergente(2);
                }, 
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 40),
                    backgroundColor: MyColors.backgroundColor,
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(l10n.cambiar + ' ' + l10n.contrasena)
                      ],
                    ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: (){
                  _ventanaEmergente(3);
                }, 
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 40),
                    backgroundColor: MyColors.backgroundColor,
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(l10n.cambiar + ' ' + l10n.trata)
                      ],
                    ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: (){
                  _ventanaEmergente(4);
                },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 40),
                    backgroundColor: MyColors.backgroundColor,
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(l10n.cambiar + ' ' + l10n.nacimiento)
                      ],
                    ),
                )
              ],
            )
          ],
        )
      )
    );
  }
}