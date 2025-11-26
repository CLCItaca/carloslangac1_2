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
    switch(index){
      case 0:
        String? _cambioNombre;
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text('Cambiar Nombre'),
          content:SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Nuevo Nombre",
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
                    child: Text('Cancelar'),
                    ),
                    OutlinedButton(onPressed: (){
                      widget.usuario.setNombre(_cambioNombre!);
                      print(widget.usuario.getNombre());
                      Navigator.pop(context);
                    }, 
                      child: Text('Aceptar')
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
            title: Text('Cambiar Edad'),
            content:SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Nuevo Edad",
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
                      child: Text('Cancelar'),
                      ),
                      OutlinedButton(onPressed: (){
                        widget.usuario.setEdad(int.parse(_cambioEdad!));
                        Navigator.pop(context);
                      }, 
                        child: Text('Aceptar')
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
            title: Text('Cambiar Contraseña'),
            content:SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Nueva Contraseña",
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
                      child: Text('Cancelar'),
                      ),
                      OutlinedButton(onPressed: (){
                        widget.usuario.setPasswrd(_cambioPass!);
                        Navigator.pop(context);
                      }, 
                        child: Text('Aceptar')
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
              title: Text('Cambiar Contraseña'),
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
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () => Navigator.pop(context),
                        child: Text('Cancelar'),
                        ),
                        OutlinedButton(onPressed: (){
                          widget.usuario.setTrata(_cambioTrata!);
                          Navigator.pop(context);
                        }, 
                          child: Text('Aceptar')
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
              title: Text('Cambiar Lugar de Nacimiento'),
              content:SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Nueva Lugar de Nacimiento",
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
                        child: Text('Cancelar'),
                        ),
                        OutlinedButton(onPressed: (){
                          widget.usuario.setPasswrd(_cambioNacimiento!);
                          Navigator.pop(context);
                        }, 
                          child: Text('Aceptar')
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 167, 198, 255),
        title: Text('Editar Usuario')
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
                    backgroundColor: Color.fromARGB(255, 227, 237, 255),
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Cambiar Nombre')
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
                    backgroundColor: Color.fromARGB(255, 227, 237, 255),
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Cambiar Edad')
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
                    backgroundColor: Color.fromARGB(255, 227, 237, 255),
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Cambiar Contraseña')
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
                    backgroundColor: Color.fromARGB(255, 227, 237, 255),
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Cambiar Trata')
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
                    backgroundColor: Color.fromARGB(255, 227, 237, 255),
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Cambiar Lugar de Nacimiento')
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